//
//  NativeLexeme.swift
//  QuCore
//
//  Created by Oleg Dreyman on 21.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

/// An entity which represents a given translation for some other foreign lexeme.
public struct NativeLexeme: Lexeme {

    /// Main morpheme of lexeme.
    public let lemma: Morpheme
    /// Description of lexeme meaning.
    public let meaning: String
    /// Level of how often and "normal" it feels to use this lexeme in native language.
    public let usage: Usage
    
    public init(lemma: Morpheme, meaning: String, usage: Usage) {
        self.lemma = lemma
        self.meaning = meaning
        self.usage = usage
    }

    #if swift(>=3.0)
    public enum Usage: String, Prioritied {
        case general
        case promising
        case rare
        case fancy
        
        public var priority: Int {
            switch self {
            case .general:
                return 1
            case .promising:
                return 2
            case .fancy:
                return 3
            case .rare:
                return 4
            }
        }
    }
    #else
    public enum Usage: String, Prioritied {
        /// The lexeme is generally accepted an society.
        case General = "general"
        /// Lexeme sounds a bit strange, but natural.
        case Promising = "promising"
        /// Use of this lexeme in native language is extra-rare and sounds weird.
        case Rare = "rare"
        /// Completely native but completely fancy. For example, "селфи" -> "самострел"
        case Fancy = "fancy"
        
        public var priority: Int {
            switch self {
            case .General:
                return 1
            case .Promising:
                return 2
            case .Fancy:
                return 3
            case .Rare:
                return 4
            }
        }
    }
    #endif

}

extension NativeLexeme: Hashable {
    
    public var hashValue: Int {
        return lemma.view.hashValue
    }
    
}

public func == (left: NativeLexeme, right: NativeLexeme) -> Bool {
    return left.lemma.view == right.lemma.view && left.meaning == right.meaning && left.usage == right.usage
}