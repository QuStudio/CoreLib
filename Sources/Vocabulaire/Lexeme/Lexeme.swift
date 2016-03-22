//
//  Lexeme.swift
//  QuCore
//
//  Created by Oleg Dreyman on 21.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

public protocol Lexeme {

    var lemma: Word { get }
    var meaning: Word { get }

}
