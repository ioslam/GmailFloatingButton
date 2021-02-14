//
//  AppDelegate.swift
//  GmailFloatingButton
//
//  Created by Eslam Mohamed on 09/02/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let windowScene = UIWindow(frame: UIScreen.main.bounds)
        self.window = windowScene
        windowScene.rootViewController = UINavigationController(rootViewController: AllEmailsVCViewController())
        windowScene.makeKeyAndVisible()
        return true
    }
    
    
    
    
}

