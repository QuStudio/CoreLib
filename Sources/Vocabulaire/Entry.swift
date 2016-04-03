//
//  Entry.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 22.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

/// An entity which represents dictionary entry (aka the translation).
public struct Entry {
    
    /// Entry identifier.
    public let id: Int
    /// Foreign lexeme.
    public let foreign: ForeignLexeme
    /// Set of translations of foreign lexeme.
    public let natives: Set<NativeLexeme>
    /// Author of Entry.
    public let author: User?
    
    public init(id: Int, foreign: ForeignLexeme, natives: Set<NativeLexeme>, author: User? = nil) {
        self.id = id
        self.foreign = foreign
        self.natives = natives
        self.author = author
    }
    
}

extension Entry: Equatable { }

public func == (left: Entry, right: Entry) -> Bool {
    return left.id == right.id &&
        left.foreign == right.foreign &&
        left.natives == right.natives &&
        left.author == right.author
}

extension Entry {
    
    #if swift(>=3.0)
    public var nativesByUsage: [NativeLexeme] {
        return natives.sorted { $0.usage.priority < $1.usage.priority }
    }
    
    #else
    
    /// An array of translations sorted by Usage.
    /// - Note: Usage is an enum declared in NativeLexeme.Usage.
    public var nativesByUsage: [NativeLexeme] {
        return natives.sort({ $0.usage.priority < $1.usage.priority })
    }
    #endif
    
}