//
//  Lexeme.swift
//  QuCore
//
//  Created by Oleg Dreyman on 21.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation



struct Lexeme {
    
    var lemma: Word
    var forms: [Word]?
    var origin: Word
    var meaning: Word
    var permissibility: Permissibility
    
}

enum Permissibility {
    
    case NotAllowed(reason: String)
    case NotRecommended(reason: String)
    case GenerallyAllowed(reason: String)
    case Allowed
    
}