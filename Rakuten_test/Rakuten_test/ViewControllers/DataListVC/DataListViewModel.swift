//
//  DataListViewModel.swift
//  CartrackChallenge
//
//  Created by venajr on 11/4/21.
//

import Foundation
import UIKit

protocol DataListViewModelDelegate {
    func loadUsers(lastIndex: Int)
}

class DataListViewModel: NSObject {
    var users: [User] = []
    var delegate: DataListViewModelDelegate?
    var nextUrl: String?
    func callFetchUsers() {
        APIHelper.fetchUsers(nextURL: nextUrl) { [unowned self] (users, nextUrl)  in
            let lastIndex = self.users.count
            self.users.append(contentsOf: users)
            self.nextUrl = nextUrl
            self.delegate?.loadUsers(lastIndex: lastIndex)
        } failure: { (errorMessage) in
            if let error = errorMessage {
                Helpers.showErrorAlert(withMessage: error)
            } else {
                Helpers.showDefaultErrorAlert()
            }
        }
    }
    
    func formatCell(cell: UserCell, user: User) {
        APIHelper.setImage(to: cell.imgAvatar, withUrl: user.links?.avatar?["href"] ?? "")
        cell.lblName.text = user.name
        cell.lblType.text = user.type
        cell.lblCreatedOn.text = convertedDate(dateStr: user.createdOn ?? "")
        cell.tintColor = .white
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.textColor = .white
    }
    
    func convertedDate(dateStr: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from:dateStr) {
            dateFormatter.dateFormat = "dd MMM yyyy hh:mm a"
            return dateFormatter.string(from: date)
        }
        return dateStr
    }
}
