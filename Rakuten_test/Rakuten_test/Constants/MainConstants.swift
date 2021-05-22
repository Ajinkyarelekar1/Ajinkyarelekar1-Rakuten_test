//
//  MainConstants.swift
//  CartrackChallenge
//
//  Created by venajr on 11/4/21.
//

import Foundation
import UIKit
struct MainConstants {
    static let baseURL = "https://api.bitbucket.org/2.0/"
    static var useMockForTest = false
}

enum StoryBoards: String {
    case main = "Main"
}

enum APIServices: String {
    case users = "repositories"
    
    var endpoint: String {
        switch self {
        case .users:
            return MainConstants.baseURL + self.rawValue
        }
    }
}

struct UIConstants {
    static let textCellIdentifier = "textCell"
    static let textCellHeight: CGFloat = 54
}
