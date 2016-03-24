//
//  ForeignLexeme.swift
//  QuCore
//
//  Created by Oleg Dreyman on 21.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

public struct ForeignLexeme: Lexeme {

    public let lemma: Morpheme
    public let forms: [Morpheme]
    public let origin: Morpheme
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

extension ForeignLexeme: Equatable { }

public func == (left: ForeignLexeme, right: ForeignLexeme) -> Bool {
    return left.lemma.view == right.lemma.view &&
        left.forms.map({ $0.view }) == right.forms.map({ $0.view }) &&
        left.origin.view == right.origin.view &&
        left.meaning == right.meaning &&
        left.permissibility == right.permissibility
}