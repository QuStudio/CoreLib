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
    var foreign: Word { get }
    var native: NativeWordsRequest { get }
    var rationale: String { get }
    
}

public struct ClientEntryRequest: EntryRequest {
    
    public let author: User
    public let foreign: Word
    public let native: NativeWordsRequest
    public let rationale: String
    
}

public struct ServerEntryRequest: EntryRequest {
    
    public let id: Int
    public let author: User
    public let foreign: Word
    public let native: NativeWordsRequest
    public let rationale: String
    
}