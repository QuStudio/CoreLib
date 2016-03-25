//
//  CaseSensitiveWord.swift
//  QuCore
//
//  Created by Oleg Dreyman on 22.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

/// Case sensitive morpheme, i.e. one which cares about the way it's written.
public struct CaseSensitiveMorpheme: Morpheme {

    /// Creates case sensitive morpheme for given string.
    public init(_ value: String) {
        self.view = value
    }
    /// String representation of morpheme.
    public let view: String

}

// Extension to support StringLiteralConvertible protocol.
extension CaseSensitiveMorpheme: StringLiteralConvertible {

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

extension CaseSensitiveMorpheme: Hashable {

    public var hashValue: Int {
        return view.hashValue
    }

}

public func == (left: CaseSensitiveMorpheme, right: CaseSensitiveMorpheme) -> Bool {
    return left.view == right.view
}
