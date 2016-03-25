//
//  ServerEntryproposal.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 25.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

/// EntryProposal which is handled on server-side.
/// - Note: this struct can also be sent to client-side to present in activity feed or something like that. So when user post ClientEntryProposal - it's gone, and then he can follow the status of his proposal via ServerEntryProposal.
public struct ServerEntryProposal: EntryProposal {
    
    /// proposal identifier.
    public let id: Int
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
    /// Status of proposal.
    public var status: Status
    
    /// Status of proposal.
    public enum Status {
        /// Accepted in some way and already available on Qubular.
        case Implemented
        /// Accepted without massive changes.
        case Accepted
        /// Accepted with changes.
        case AcceptedWithChanges(changes: String)
        /// Rejected with following rationale.
        case Rejected(rationale: String)
        /// Under review.
        case UnderReview
        /// Awaiting for review.
        case Awaiting
    }
    
    /// Creates an instance for given client entry proposal, id and status.
    ///
    /// - Parameter status: awaiting by default.
    public init(clientProposal: ClientEntryProposal, id: Int, status: Status = .Awaiting) {
        self.id = id
        self.author = clientProposal.author
        self.foreign = clientProposal.foreign
        self.native = clientProposal.native
        self.rationale = clientProposal.rationale
        self.postedAt = clientProposal.postedAt
        self.status = status
    }
    
}

extension ServerEntryProposal {
    
    /// Core init using all values.
    public init(id: Int, author: User, foreign: Morpheme, native: NativesProposal, rationale: String, postedAt: NSDate, status: Status) {
        self.id = id
        self.author = author
        self.foreign = foreign
        self.native = native
        self.rationale = rationale
        self.postedAt = postedAt
        self.status = status
    }
    
}