//
//  AppDelegate.swift
//  Rakuten_test
//
//  Created by venajr on 22/5/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        guard let rootVC = UIHelper.rootViewController() else {
            fatalError("failed to get rootVC")
        }
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }
}

