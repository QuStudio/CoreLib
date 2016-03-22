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
    public let remark: String?
    public let permissibility: Permissibility

    public enum Permissibility {
        case NotAllowed//(reason: String)
        case NotRecommended//(reason: String)
        case GenerallyAllowed//(reason: String)
        case Allowed
    }

}
