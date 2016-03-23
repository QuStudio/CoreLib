//
//  Entry.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 22.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

public struct Entry {
    
    public let id: Int
    public let foreign: ForeignLexeme
    public let natives: Set<NativeLexeme>
    public let author: User?
    
    public init(id: Int, foreign: ForeignLexeme, natives: Set<NativeLexeme>, author: User? = nil) {
        self.id = id
        self.foreign = foreign
        self.natives = natives
        self.author = author
    }
    
}

extension Entry {
    
    public var nativesByUsage: [NativeLexeme] {
        return natives.sort({ $0.usage.priority < $1.usage.priority })
    }
    
}