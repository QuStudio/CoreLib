//
//  User.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 23.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

public struct User {
    
    public let id: Int
    public let username: String
    public let status: Status
    
    public enum Status {
        case Regular
        case BoardMember
    }
    
}