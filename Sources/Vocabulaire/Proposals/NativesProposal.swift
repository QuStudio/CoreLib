//
//  NativeWordsproposal.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 23.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

/// Container of proposed translations to native language.
public struct NativesProposal {
    
    /// Main proposed translation.
    public let main: Morpheme
    /// Optional alternatives.
    /// - Note: alternate forms of one word or alternative proposals. Both good.
    public let alternatives: [Morpheme]?
    
    /// Creates a proposal for given main morpheme and alternatives.
    public init(main: Morpheme, alternatives: [Morpheme]? = nil) {
        self.main = main
        self.alternatives = alternatives
    }
    
}
