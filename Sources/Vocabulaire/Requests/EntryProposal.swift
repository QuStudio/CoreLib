//
//  Entryproposal.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 23.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

/// Abstraction of proposal for new entry.
public protocol EntryProposal {
    
    /// Author of proposal.
    var author: User { get }
    /// Foreign word.
    var foreign: Morpheme { get }
    /// Translate options.
    /// - Note: See NativesProposal struct for more info.
    var native: NativesProposal { get }
    /// Rationale of proposal.
    /// - Note: обоснование
    var rationale: String { get }
    /// Date at which proposal was created/posted.
    var postedAt: NSDate { get }
    
}