//
//  RootViewController.swift
//  HomeLoginSwift
//
//  Created by Apostol, Alexandru on 03/08/2019.
//  Copyright © 2019 Apostol, Alexandru. All rights reserved.
//

import UIKit
import HomeLoginCore

class RootViewController: UIViewController {
    
    private  let validation = ApiDataSouce()
    


    @IBAction func loginButton(_ sender: UIButton) {
       
        validation.getUsers(name: userNameLabel.text!, password: passwordLabel.text!) { succes in
            if succes {
                let tabBarMenuView =  TabBarViewController()
                
               
               
                tabBarMenuView.userId = self.passwordLabel.text
                
               self.present(tabBarMenuView, animated: true)
                
                
                  
            }
            
        }
    }
    
    @IBOutlet weak var userNameLabel: UITextField!
    
    
    @IBOutlet weak var passwordLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    

}
