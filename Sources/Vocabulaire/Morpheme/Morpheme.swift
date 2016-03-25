//
//  Word.swift
//  QuCore
//
//  Created by Oleg Dreyman on 21.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

/// Represents Morpheme (aka Word) type.
/// - Note: In linguistics, a morpheme is the smallest grammatical unit in a language. In other words, it is the smallest meaningful unit of a language. - Wikipedia
public protocol Morpheme: CustomStringConvertible {

    /// Creates a morpheme from given string.
    init(_ value: String)
    /// String representation of way in which morpheme needs to be primarily viewed.
    var view: String { get }

}

extension Morpheme {

    public var description: String {
        return view
    }
    
}