//
//  TabBarViewController.swift
//  HomeLoginSwift
//
//  Created by Apostol, Alexandru on 04/08/2019.
//  Copyright © 2019 Apostol, Alexandru. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
        private let webViewController = WebViewViewController()
        private let todoViewController = TodoViewController()
        private let rootViewController = RootViewController()
    public var userId: String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
      
        viewControllers = [controller(title: "web", vc: webViewController),
        controller(title: "todos", vc: todoViewController)]

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        todoViewController.userID = self.userId
    }
    
    private func controller (title: String, vc: UIViewController) -> UIViewController {
            let recentVc = UINavigationController(rootViewController: vc)
        recentVc.tabBarItem.title = title
        return recentVc
    }
    
    
    
    
}
