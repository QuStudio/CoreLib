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