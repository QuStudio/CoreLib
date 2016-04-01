//
//  Lexeme.swift
//  QuCore
//
//  Created by Oleg Dreyman on 21.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

/// Basic protocol for Lexeme entity.
/// - SeeAlso: [https://en.wikipedia.org/wiki/Lexeme](https://en.wikipedia.org/wiki/Lexeme)
public protocol Lexeme {

    /// Main morpheme of lexeme.
    /// - Note: In morphology and lexicography, a lemma (plural lemmas or lemmata) is the canonical form, dictionary form, or citation form of a set of words (headword). In English, for example, run, runs, ran and running are forms of the same lexeme, with run as the lemma. - Wikipedia
    var lemma: Morpheme { get }
    /// Description of lexeme meaning.
    var meaning: String { get }

}
