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
        return self.sort({ $0.foreign.lemma.view < $1.foreign.lemma.view })
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