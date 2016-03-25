//
//  ForeignLexeme.swift
//  QuCore
//
//  Created by Oleg Dreyman on 21.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

/// An entity representing translating lexeme.
public struct ForeignLexeme: Lexeme {

    /// Main morpheme of lexeme.
    public let lemma: Morpheme
    /// Alternate forms of lexeme. Doesn't include lemma.
    /// - Note: lemma - "джуниор", forms - ["джун", "джундев", ... ]
    public let forms: [Morpheme]
    /// Origin of lexeme in one word.
    public let origin: Morpheme
    /// Description of lexeme meaning.
    public let meaning: String
    /// Level of how bad the foreign word is.
    public let permissibility: Permissibility
    
    /// Level of how bad the foreign word is.
    public enum Permissibility: Int, Prioritied {
        /// Native lexeme or foreign lexeme which has distinct, clear meaning in native language.
        case Allowed = 1
        /// Lexeme is generally allowed to use in native language.
        case GenerallyAllowed
        /// There are good native analogues, so lexeme is not recommended to use.
        case NotRecommended
        /// Avoid use of this lexemes.
        case NotAllowed
        
        public var priority: Int {
            return rawValue
        }
    }

}

extension ForeignLexeme: Equatable { }

public func == (left: ForeignLexeme, right: ForeignLexeme) -> Bool {
    return left.lemma.view == right.lemma.view &&
        left.forms.map({ $0.view }) == right.forms.map({ $0.view }) &&
        left.origin.view == right.origin.view &&
        left.meaning == right.meaning &&
        left.permissibility == right.permissibility
}