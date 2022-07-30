//
//  AppDelegate.swift
//  instagram
//
//  Created by Ibrahim Mo Gedami on 7/29/22.
//

import UIKit
import Firebase
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let mainViewController = SignUpViewController()
        let nav = UINavigationController(rootViewController: mainViewController)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        FirebaseApp.configure()
        return true
    }

}

