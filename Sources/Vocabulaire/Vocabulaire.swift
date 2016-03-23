//
//  Vocabulaire.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 23.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

// TODO: Rename to Vocabulary.swfit

import Foundation

public typealias Vocabulary = [Entry]

extension SequenceType where Generator.Element == Entry {

	var alphabetical: Vocabulary {
		return self.sort({ $0 < $1 })
	}

}