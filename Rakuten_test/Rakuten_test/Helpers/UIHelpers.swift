//
//  UIHelpers.swift
//  CartrackChallenge
//
//  Created by venajr on 11/4/21.
//

import Foundation
import UIKit

struct UIHelper {
    static func rootViewController() -> UIViewController? {
        return UIStoryboard(name: StoryBoards.main.rawValue,
                            bundle: .main).instantiateInitialViewController()
    }
    static func vcFromSB(from storyboard: StoryBoards, withIdentifier identifier: String) -> UIViewController {
        let storyBoard = UIStoryboard(name: storyboard.rawValue, bundle: .main)
        return storyBoard.instantiateViewController(withIdentifier: identifier)
    }
}


extension UIView {
    var globalPoint: CGPoint? {
        return self.superview?.convert(self.frame.origin, to: nil)
    }
    
    func roundedCorners(withColor color: UIColor = .clear) {
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = color.cgColor
    }
}

extension UITableView {
    func setdefaults() {
        self.separatorStyle = .none
        self.tableFooterView = UIView()
    }
    func registerCell<T: BaseTableCell>(cellType: T.Type) {
        self.register(cellType.nib(), forCellReuseIdentifier: cellType.cellIdentifier())
    }
}

