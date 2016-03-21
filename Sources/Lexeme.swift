//
//  Lexeme.swift
//  QuCore
//
//  Created by Oleg Dreyman on 21.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation



struct Lexeme {
    
    var lemma: String
    var forms: Set<String>?
    var meaning: String
    var permissibility: Permissibility
    
}

enum Permissibility {
    
    case NotAllowed
    case NotRecommended
    case GenerallyAllowed
    case Allowed
    
}