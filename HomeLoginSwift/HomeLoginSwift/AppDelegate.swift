//
//  AppDelegate.swift
//  HomeLoginSwift
//
//  Created by Apostol, Alexandru on 03/08/2019.
//  Copyright © 2019 Apostol, Alexandru. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
       self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window?.rootViewController = RootViewController(nibName: nil, bundle: nil)
        
        self.window?.makeKeyAndVisible()
        
        return true
    }

    


}

