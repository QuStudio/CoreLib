//
//  ClientEntryRequest.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 25.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import Foundation

public struct ClientEntryRequest: EntryRequest {
    
    public let author: User
    public let foreign: Morpheme
    public let native: NativesRequest
    public let rationale: String
    public let postedAt: NSDate
    
}