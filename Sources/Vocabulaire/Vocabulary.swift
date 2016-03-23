//
//  Vocabulaire.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 23.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

public typealias Vocabulary = [Entry]

extension SequenceType where Generator.Element == Entry {

	var alphabetical: Vocabulary {
		return self.sort({ $0.foreign.lemma.view < $1.foreign.lemma.view })
	}

}