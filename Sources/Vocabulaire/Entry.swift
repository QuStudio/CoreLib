//
//  Entry.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 22.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

public struct Entry {
    
    // maybe it should also contain some sort of ID?
    public let foreign: ForeignLexeme
    public let natives: Set<NativeLexeme>
    
}

extension Entry {
    
    public var nativesByUsage: [NativeLexeme] {
        return natives.sort({ $0.usage.priority < $1.usage.priority })
    }
    
}