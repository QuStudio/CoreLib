//
//  ServerEntryRequest.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 25.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

public struct ServerEntryRequest: EntryRequest {
    
    public let id: Int
    public let author: User
    public let foreign: Morpheme
    public let native: NativesRequest
    public let rationale: String
    public let postedAt: NSDate
    public var status: Status
    
    public enum Status {
        case Accepted
        case AcceptedWithChanges(changes: String)
        case Rejected(rationale: String)
        case UnderReview
        case Awaiting
    }
    
}