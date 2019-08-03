//
//  Todo.swift
//  HomeLoginCore
//
//  Created by Apostol, Alexandru on 03/08/2019.
//  Copyright © 2019 Apostol, Alexandru. All rights reserved.
//

import Foundation

public struct Todo: Decodable {
    
    public let userId: Int
    public let id: Int
    public let title : String
    public let completed : Bool
}
