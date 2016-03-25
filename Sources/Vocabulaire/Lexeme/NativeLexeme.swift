//
//  NativeLexeme.swift
//  QuCore
//
//  Created by Oleg Dreyman on 21.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

/// An entity which represents a given translation for some other foreign lexeme.
public struct NativeLexeme: Lexeme {

    /// Main morpheme of lexeme.
    public let lemma: Morpheme
    /// Description of lexeme meaning.
    public let meaning: String
    /// Level of how often and "normal" it feels to use this lexeme in native language.
    public let usage: Usage

    public enum Usage: Int, Prioritied {
        /// The lexeme is generally accepted an society.
        case General = 1
        /// Lexeme sounds a bit strange, but natural.
        case Promising
        /// Use of this lexeme in native language is extra-rare and sounds weird.
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