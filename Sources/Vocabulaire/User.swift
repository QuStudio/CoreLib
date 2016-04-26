//
//  User.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 23.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

/// Basic entity which represents a user of Qubular.
public struct User {
    
    /// User identifier.
    public let id: Int
    /// Username.
    public let username: String
    /// Determines user privileges and access level.
    public let status: Status
    
    public init(id: Int, username: String, status: Status) {
        self.id = id
        self.username = username
        self.status = status
    }
    
    #if swift(>=3.0)
    public enum Status {
        case regular
        case boardMember
    }
    #else
    public enum Status {
        case Regular
        case BoardMember
    }
    #endif
    
}

extension User: Equatable { }

public func == (left: User, right: User) -> Bool {
    return left.id == right.id && left.username == right.username && left.status == right.status
}