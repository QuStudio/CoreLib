//
//  Vocabulaire.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 23.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

/// An array of entrues.
public typealias Vocabulary = [Entry]

#if swift(>=3.0)
    extension Sequence where Iterator.Element == Entry {
    
    /// Entries sorted in alphabetical order.
    var alphabetical: Vocabulary {
    return self.sorted { $0.foreign.lemma.view < $1.foreign.lemma.view }
    }
    
    }
    
#else
    extension SequenceType where Generator.Element == Entry {
        
        /// Entries sorted in alphabetical order.
        var alphabetical: Vocabulary {
            return self.sort({ $0.foreign.lemma.view < $1.foreign.lemma.view })
        }
        
    }
#endif

public struct VocabularyVersion {
    public let major: Int
    public let minor: Int
    public let patch: Int
    
    public init(major: Int, minor: Int, patch: Int) {
        self.major = major
        self.minor = minor
        self.patch = patch
    }
}

extension VocabularyVersion {
    public static var develop: VocabularyVersion {
        return VocabularyVersion(major: 0, minor: 0, patch: 0)
    }
}
