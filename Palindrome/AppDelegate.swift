//
//  AppDelegate.swift
//  Palindrome
//
//  Created by Virgilius Santos on 20/10/2018.
//  Copyright © 2018 Virgilius Santos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        KeyboardManager.shared.enable = true
        return true
    }


}

