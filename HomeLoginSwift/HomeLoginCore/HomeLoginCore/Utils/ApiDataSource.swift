//
//  ApiDataSource.swift
//  HomeLoginCore
//
//  Created by Apostol, Alexandru on 04/08/2019.
//  Copyright © 2019 Apostol, Alexandru. All rights reserved.
//

import Foundation

open class ApiDataSouce{
    public init(){
        
    }
    
    open func getUsers(name: String, password: String, callback: @escaping (Bool) -> Void) {
        
        guard !checkForEmptyStringValues(string1: name, string2: password) else {
            print("The values are empty")
            return
        }
        
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        URLSession.shared.get(url, type: [User].self) { users in
            guard let users = users else {
                
                callback(false)
                return
            }
            if users.first(where: { $0.username == name && $0.id == self.castStringToInt(stringValue: password) }) != nil {
                callback(true)
            } else {
                print("bad username or password")
                callback(false)
            }
        }
        
    }
    
    private func checkForEmptyStringValues(string1: String , string2: String) -> Bool {
        
        return string1.isEmpty && string2.isEmpty
    }
    
    private func castStringToInt(stringValue: String) -> Int{
        
        guard let convertedValue = Int(stringValue)  else {
            print("Password Cannot be converted to int \(stringValue)")
            return 0
        }
        
        return convertedValue
    }
    public func todosURL(pass: String) -> URL {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "jsonplaceholder.typicode.com"
        urlComponent.path = "/todos"
        
        urlComponent.queryItems = [
            URLQueryItem(name: "userId", value: pass)
        ]
        
        return urlComponent.url!
    }
}
