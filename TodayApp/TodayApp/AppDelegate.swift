//
//  AppDelegate.swift
//  TodayApp
//
//  Created by Marilise Morona on 01/06/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = NoteListViewController()
        let navigation = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigation
        return true
    }
    
}
