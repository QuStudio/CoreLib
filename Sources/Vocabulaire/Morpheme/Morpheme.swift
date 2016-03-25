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
public struct Morpheme {

    /// Private storage for string which was passed to initializaer.
    private let string: String
    public let type: Kind

    /// Creates case insensitive morpheme for given string. "Aapl", "AAPL" and "aaPl" will produce same result.
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
    /// - Warning: will always produce capitalized string.
    /// - Note: "менеджер" -> "Менеджер".
    public var view: String {
        switch type {
        case .General:
            return string.capitalizedString
        case .CaseSensitive:
            return string
        }
    }
    
    public enum Kind {
        case General
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
    return left.view == right.view && left.type == right.type
}
