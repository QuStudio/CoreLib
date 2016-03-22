//
//  NativeLexeme.swift
//  QuStudio/Vocabulaire
//
//  Created by Oleg Dreyman on 21.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

public struct NativeLexeme: Lexeme {

    public let lemma: Word
    public let meaning: String
    public let remark: String?
    public let usage: Usage

    public enum Usage {
        case General
        case Promising
        case Rare
        case Icky
    }

}
