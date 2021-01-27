//
//  AppDelegate.swift
//  Xumak Test
//
//  Created by Erick Pac on 27/01/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = HomeConfigurator.getController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
}
