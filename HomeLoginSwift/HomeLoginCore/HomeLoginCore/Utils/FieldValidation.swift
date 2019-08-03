//
//  FieldValidation.swift
//  HomeLoginCore
//
//  Created by Apostol, Alexandru on 03/08/2019.
//  Copyright © 2019 Apostol, Alexandru. All rights reserved.
//

import Foundation




public struct FieldValidation {
    
    private var password: Int
       
    
   private  var username: String
    
    public func checkPasswordIsInt(password: Any?) -> Bool{
        
        guard (password as! Int?) != nil
            else {
                return false
        }
        return true
        
    }
    
    public func getIntPasswordFromUITextLabel(password: UILabel?) -> Bool{
        guard let pass = password?.text else {
            return false
        }
        self.setPassword(pwd: Int(pass)!)
        return true
        
    }
    
    
    public func getPassword () -> Int {
        return self.password
    }
    
   private func setPassword (pwd: Int)  {
    
    }
   
    
    
}
