//
//  GeneralWord.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 22.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

/// Case insensitive morpheme - it just doesn't care about way it's written or showed.
/// - Note: "баг", "менеджер", "девелопмент" and so on.
public struct GeneralMorpheme: Morpheme {

    /// Private storage for string which was passed to initializaer.
    private let string: String

    /// Creates case insensitive morpheme for given string. "Aapl", "AAPL" and "aaPl" will produce same result.
    public init(_ value: String) {
        self.string = value.lowercaseString
    }
    
    /// String representation of morpheme.
    /// - Warning: will always produce capitalized string.
    /// - Note: "менеджер" -> "Менеджер".
    public var view: String {
        return capitalized
    }
    
    /// Produce a string with the first character from each word changed to the corresponding uppercase value.
    public var capitalized: String {
        return string.capitalizedString
    }
    
    public var lowercase: String {
        return string
    }

    public var uppercase: String {
        return string.uppercaseString
    }

}

// Extension to support StringLiteralConvertible protocol.
extension GeneralMorpheme: StringLiteralConvertible {

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

extension GeneralMorpheme: Hashable {

    public var hashValue: Int {
        return lowercase.hashValue
    }

}

public func == (left: GeneralMorpheme, right: GeneralMorpheme) -> Bool {
    return left.lowercase == right.lowercase
}