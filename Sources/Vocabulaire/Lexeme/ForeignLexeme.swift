//
//  ForeignLexeme.swift
//  QuCore
//
//  Created by Oleg Dreyman on 21.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

public struct ForeignLexeme: Lexeme {

    public let lemma: Word
    public let forms: [Word]?
    public let origin: Word
    public let meaning: String
    public let permissibility: Permissibility
    
    public enum Permissibility: Int, Prioritied {
        case Allowed = 1
        case GenerallyAllowed
        case NotRecommended
        case NotAllowed
        
        public var priority: Int {
            return rawValue
        }
    }

}
