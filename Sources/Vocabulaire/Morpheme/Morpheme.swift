//
//  GeneralWord.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 22.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

/// Represents Morpheme (aka Word) type.
/// - Note: In linguistics, a morpheme is the smallest grammatical unit in a language. In other words, it is the smallest meaningful unit of a language. - Wikipedia
public struct Morpheme {

    /// Private storage for string which was passed to initializaer.
    private let string: String
    /// Type of Morpheme.
    /// - Note: see Kind for details.
    public let type: Kind

    /// Creates morpheme for given string with choosen type.
    public init(_ value: String, type: Kind = .General) {
        self.type = type
        switch type {
        case .General:
            self.string = value.lowercaseString
        case .CaseSensitive:
            self.string = value
        }
    }
    
    /// String representation of morpheme.
    /// - Warning: general morpheme will always produce capitalized string. ("менеджер" -> "Менеджер")
    public var view: String {
        switch type {
        case .General:
            return string.capitalizedString
        case .CaseSensitive:
            return string
        }
    }
    
    /// Type of morpheme
    public enum Kind {
        /// Doesn't care about how it's written
        case General
        /// Do care about how it's written
        case CaseSensitive
    }
    
}

// Extension to support StringLiteralConvertible protocol.
extension Morpheme: StringLiteralConvertible {

    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(value)
    }

    public init(unicodeScalarLiteral value: String) {
        self.init(value)
    }

}

extension Morpheme: CustomStringConvertible {
    public var description: String {
        return view
    }
}

extension Morpheme: Hashable {

    public var hashValue: Int {
        return string.hashValue
    }

}

public func == (left: Morpheme, right: Morpheme) -> Bool {
    //return left.view == right.view && left.type == right.type
    return left.type == right.type && left.view == right.view
}
