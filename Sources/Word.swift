//
//  Word.swift
//  QuCore
//
//  Created by Oleg Dreyman on 21.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

public protocol Word: CustomStringConvertible {

    init(string value: String)
    var view: String { get }

}

extension Word {

    public var description: String {
        return view
    }

}

public struct CaseSensitiveWord: Word {
    
    public init(string value: String) {
        self.view = value
    }
    public let view: String
    
}


extension CaseSensitiveWord: StringLiteralConvertible {
    
    public init(stringLiteral value: StringLiteralType) {
        self.init(string: value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(string: value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.init(string: value)
    }
    
}

extension CaseSensitiveWord: Hashable {
    
    public var hashValue: Int {
        return view.hashValue
    }
    
}

public func == (left: CaseSensitiveWord, right: CaseSensitiveWord) -> Bool {
    return left.view == right.view
}