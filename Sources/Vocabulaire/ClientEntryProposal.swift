//
//  ClientEntryproposal.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 25.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

/// Entry proposal which is created on client-side. 
public struct ClientEntryProposal: EntryProposal {
    
    /// Author of proposal.
    public let author: User
    /// Foreign word.
    public let foreign: Morpheme
    /// Translate options.
    /// - Note: See NativesProposal struct for more info.
    public let native: NativesProposal
    /// Rationale of proposal.
    /// - Note: обоснование
    public let rationale: String
    /// Date at which proposal was created/posted.
    public let postedAt: NSDate
    
}