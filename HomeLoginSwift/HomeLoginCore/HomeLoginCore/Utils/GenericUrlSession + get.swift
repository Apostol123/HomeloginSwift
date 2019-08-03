//
//  GenericUrlSession + get.swift
//  HomeLoginCore
//
//  Created by Apostol, Alexandru on 03/08/2019.
//  Copyright © 2019 Apostol, Alexandru. All rights reserved.
//

import Foundation

public extension URLSession {
    
 func get<T>(_ url: URL, type: T.Type, callback: @escaping(T?) -> Void) where T: Decodable{
        
        let dataTask = self.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print("Systerm error: \(error.localizedDescription)")
           
                    callback(nil)
                
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid Response")
                callback(nil)
                return
            }
            switch httpResponse.statusCode{
            case 200 :
                guard let newData = data,
                    let result = try? JSONDecoder().decode(type, from: newData) else {
                        print("Not able to decode")
                        callback(nil)
                        return
                }
                callback(result)
                
            case 404:
                print("Resource not found: \(url.absoluteURL)")
                callback(nil)
                
            default: print("Undefined Error")
            callback(nil)
            }
            
        }
        dataTask.resume()
        
    }
    
}
