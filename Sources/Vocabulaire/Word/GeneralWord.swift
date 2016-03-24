//
//  GeneralWord.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 22.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

public struct GeneralMorpheme: Morpheme {

    private let string: String

    public init(_ value: String) {
        self.string = value
    }

    public var view: String {
        return capitalized
    }
    
    public var capitalized: String {
        return string.capitalizedString
    }

    public var lowercase: String {
        return string.lowercaseString
    }

    public var uppercase: String {
        return string.uppercaseString
    }

}

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
