//
//  Word.swift
//  QuCore
//
//  Created by Oleg Dreyman on 21.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

public protocol Morpheme: CustomStringConvertible {

    init(_ value: String)
    var view: String { get }

}

extension Morpheme {

    public var description: String {
        return view
    }
    
}