//
//  AppDelegate.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.overrideUserInterfaceStyle = .light
        let splashVC = SplashVC(vm: .init())
        window?.rootViewController = splashVC
        window?.makeKeyAndVisible()
        return true
    }
}

