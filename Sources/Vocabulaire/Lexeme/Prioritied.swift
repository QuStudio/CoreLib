//
//  Prioritied.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 22.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

/// Shows that entities, which implement this protocol, can be sorted by priority.
public protocol Prioritied {
    var priority: Int { get }
}

extension SequenceType where Generator.Element: Prioritied {
    
    /// Just proof-of-concept. Protocol awesomeness.
    public func sortByPriority() -> [Generator.Element] {
        return self.sort({ $0.priority < $1.priority })
    }
    
}