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
            return 8
        case 1:
            return 3
        case 2:
            return 2
        case 3:
            return 3
        default:
            return 0
        }
    }
    
    func formatCell(cell: UITableViewCell, forIndexpath indexpath: IndexPath) {
        switch indexpath.section {
        case 0:
            cell.textLabel?.text = section0rowData(rowIndex: indexpath.row)
            if indexpath.row == 5 && !(user?.website ?? "").isEmpty {
                cell.accessoryType = .disclosureIndicator
            } else {
                cell.accessoryType = .none
            }
        case 1:
            cell.textLabel?.text = section1rowData(rowIndex: indexpath.row)
        case 2:
            cell.textLabel?.text = section2rowData(rowIndex: indexpath.row)
        case 3:
            cell.textLabel?.text = section3rowData(rowIndex: indexpath.row)

        default:
            break
        }
    }
    
    func section0rowData(rowIndex: Int) -> String {
        switch rowIndex {
        case 0:
            return "Full Name: " + (user?.fullName ?? "--------")
        case 1:
            return "Name: " + (user?.name ?? "--------")
        case 2:
            return "Description: " + (user?.description ?? "--------")
        case 3:
            return "Type: " + (user?.type ?? "--------")
        case 4:
            return "Size: " + (user?.size?.description ?? "--------")
        case 5:
            return "website: " + (user?.website ?? "--------")
        case 6:
            return "language: " + (user?.language ?? "--------")
        case 7:
            return "Mainbranch: " + (user?.mainbranch?["name"] ?? "--------")
        default:
            return ""
        }
    }
    
    func section1rowData(rowIndex: Int) -> String {
        switch rowIndex {
        case 0:
            return "Project Name: " + (user?.project?.name ?? "--------")
        case 1:
            return "Project Type: " + (user?.project?.type ?? "--------")
        case 2:
            return "Project Key: " + (user?.project?.key ?? "--------")
        default:
            return ""
        }
    }
    
    func section2rowData(rowIndex: Int) -> String {
        switch rowIndex {
        case 0:
            return "Workspace Name: " + (user?.workspace?.name ?? "--------")
        case 1:
            return "Workspace Type: " + (user?.workspace?.type ?? "--------")
        default:
            return ""
        }
    }
    
    func section3rowData(rowIndex: Int) -> String {
        switch rowIndex {
        case 0:
            return "Display Name: " + (user?.owner?.displayName ?? "--------")
        case 1:
            return "Nick Name: " + (user?.owner?.nickname ?? "--------")
        case 2:
            return "Owner Type: " + (user?.owner?.type ?? "--------")
        default:
            return ""
        }
    }
    
    func openWebSite() {
        if var website = user?.website {
            if website.lowercased().hasPrefix("http://")==false {
                website = "http://" + website
            }
            delegate?.showWebSite(url: website)
        }
    }
}
