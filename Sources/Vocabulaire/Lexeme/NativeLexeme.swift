//
//  NativeLexeme.swift
//  QuCore
//
//  Created by Oleg Dreyman on 21.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

public struct NativeLexeme: Lexeme {

    public let lemma: Word
    public let meaning: String
    public let usage: Usage

    public enum Usage: Int, Prioritied {
        case General = 1
        case Promising
        case Rare
        
        public var priority: Int {
            return rawValue
        }
    }

}

extension NativeLexeme: Hashable {
    
    public var hashValue: Int {
        return lemma.view.hashValue
    }
    
}

public func == (left: NativeLexeme, right: NativeLexeme) -> Bool {
    return left.lemma.view == right.lemma.view && left.meaning == right.meaning && left.usage == right.usage
}