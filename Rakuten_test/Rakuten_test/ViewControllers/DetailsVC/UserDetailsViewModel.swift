//
//  UserDetailsViewModel.swift
//  CartrackChallenge
//
//  Created by venajr on 11/4/21.
//

import Foundation
import UIKit

protocol UserDetailsViewModelDelegate {
    func showWebSite(url: String)
}

class UserDetailsViewModel: NSObject {
    var user: User?
    var delegate: UserDetailsViewModelDelegate?
    
    func sectionCount() -> Int {
        return 4
    }
    
    func rowCount(forSection section: Int) -> Int {
        switch section {
        case 0:
            return 9
        case 1:
            return 4
        case 2:
            return 2
        case 3:
            return 4
        default:
            return 0
        }
    }
    
    func formatCell(cell: UITableViewCell, forIndexpath indexpath: IndexPath) {
        
    }
    
    @IBAction func openWebSite() {
        if var website = user?.website {
            if website.lowercased().hasPrefix("http://")==false {
                website = "http://" + website
            }
            delegate?.showWebSite(url: website)
        }
    }
}
