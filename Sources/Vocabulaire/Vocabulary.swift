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

/// Version of the vocabulary, which indicates whether the client need to fetch some updates
public struct VocabularyVersion {
    /// Bumps with structural changes
    public let major: Int
    /// Bumps with new entries
    public let minor: Int
    /// Bumps with entries fixes
    public let patch: Int
    
    public init(major: Int, minor: Int, patch: Int) {
        self.major = major
        self.minor = minor
        self.patch = patch
    }
}

extension VocabularyVersion {
    /// 0.0.0 (anything can change at any time. Use this during development)
    public static var develop: VocabularyVersion {
        return VocabularyVersion(major: 0, minor: 0, patch: 0)
    }
}

extension VocabularyVersion: Comparable { }

public func == (lhs: VocabularyVersion, rhs: VocabularyVersion) -> Bool {
    return lhs.major == rhs.major && lhs.minor == rhs.minor && lhs.patch == rhs.patch
}

public func < (lhs: VocabularyVersion, rhs: VocabularyVersion) -> Bool {
    if lhs.major > rhs.major {
        return false
    } else if lhs.minor > rhs.minor {
        return false
    } else if lhs.patch >= rhs.patch {
        return false
    } else {
        return true
    }
}
