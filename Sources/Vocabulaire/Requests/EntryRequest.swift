//
//  EntryRequest.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 23.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

public protocol EntryRequest {
    
    var author: User { get }
    var foreign: Morpheme { get }
    var native: NativesRequest { get }
    var rationale: String { get }
    var postedAt: NSDate { get }
    
}

public struct ClientEntryRequest: EntryRequest {
    
    public let author: User
    public let foreign: Morpheme
    public let native: NativesRequest
    public let rationale: String
    public let postedAt: NSDate
    
}

public struct ServerEntryRequest: EntryRequest {
    
    public let id: Int
    public let author: User
    public let foreign: Morpheme
    public let native: NativesRequest
    public let rationale: String
    public let postedAt: NSDate
    
    public enum Status {
        case Accepted
        case AcceptedWithChanges(rationale: String)
        case Rejected(rationale: String)
        case UnderReview
        case Awaiting
    }
    
}