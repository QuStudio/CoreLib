//
//  Word.swift
//  QuCore
//
//  Created by Oleg Dreyman on 21.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

public struct Word {
    
    private let view: String
    public var original: String {
        return view
    }
    public var lowercase: String {
        return view.lowercaseString
    }
    public var uppercase: String {
        return view.uppercaseString
    }
    
    public init(original: String) {
        self.view = original
    }
    
}

extension Word: Hashable {
    
    public var hashValue: Int {
        return lowercase.hashValue
    }
    
}

public func == (left: Word, right: Word) -> Bool {
    return left.lowercase == right.lowercase
}

extension Word: CustomStringConvertible {
    
    public var description: String {
        return original
    }
    
}

extension Word: StringLiteralConvertible {
    
    public init(stringLiteral value: StringLiteralType) {
        self.init(original: value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(original: value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.init(original: value)
    }
    
}