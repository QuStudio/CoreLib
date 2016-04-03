//
//  GeneralWord.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 22.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

/// Represents Morpheme (aka Word) type.
/// - Note: In linguistics, a morpheme is the smallest grammatical unit in a language. In other words, it is the smallest meaningful unit of a language. - Wikipedia
public struct Morpheme {

    /// Private storage for string which was passed to initializaer.
    private let string: String
    /// Type of Morpheme.
    /// - Note: see Kind for details.
    public let type: Kind

    
    #if swift(>=3.0)
    public init(_ value: String, type: Kind = .general) {
        self.type = type
        switch type {
        case .general:
            self.string = value.lowercased()
        case .caseSensitive:
            self.string = value
        }
    }
    #else
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
    #endif
    
    /// String representation of morpheme.
    /// - Warning: general morpheme will always produce capitalized string. ("менеджер" -> "Менеджер")
    public var view: String {
        #if swift(>=3.0)
        switch type {
        case .general:
            return string.capitalized
        case .caseSensitive:
            return string
        }
        #else
        switch type {
        case .General:
            return string.capitalizedString
        case .CaseSensitive:
            return string
        }
        #endif
    }
    
    /// Type of morpheme
    public enum Kind {
        
        #if swift(>=3.0)
        case general, caseSensitive
        #else
        /// Doesn't care about how it's written
        case General
        /// Do care about how it's written
        case CaseSensitive
        #endif
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
