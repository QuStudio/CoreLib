//
//  Prioritied.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 22.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

/// Shows that entities, which implement this protocol, can be sorted by priority.
public protocol Prioritied {
    var priority: Int { get }
}

#if swift(>=3.0)
extension Sequence where Iterator.Element: Prioritied {
    /// Just proof-of-concept. Protocol awesomeness.
    public func sortByPriority() -> [Iterator.Element] {
        return self.sorted { $0.priority < $1.priority }
    }
}
#else
extension SequenceType where Generator.Element: Prioritied {
    /// Just proof-of-concept. Protocol awesomeness.
    public func sortByPriority() -> [Generator.Element] {
        return self.sort({ $0.priority < $1.priority })
    }
}
#endif