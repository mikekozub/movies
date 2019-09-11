//
//  AppDelegate.swift
//  movieDatabase
//
//  Created by Michael Kozub on 9/10/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let offersVC = MoviesViewController()
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = UINavigationController(rootViewController: offersVC)
        self.window?.makeKeyAndVisible()
        return true
    }

}

