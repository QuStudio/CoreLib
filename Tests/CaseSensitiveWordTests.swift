//
//  CaseSensitiveWordTests.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 22.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import XCTest
@testable import Vocabulaire

class CaseSensitiveWordTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testEquality() {
        let word: CaseSensitiveWord = "USA"
        XCTAssertEqual(word.view, "USA")
    }
    
    func testTwoWordsEqual() {
        let first: CaseSensitiveWord = "NYPD"
        let second: CaseSensitiveWord = "NYPD"
        XCTAssertTrue(first == second)
    }
    
    func testTwoWordsNotEqual() {
        let first: CaseSensitiveWord = "AAPL"
        let second: CaseSensitiveWord = "aaPl"
        XCTAssertFalse(first == second)
    }
    
    func testNotEquality() {
        let word = CaseSensitiveWord("USPS")
        XCTAssertNotEqual(word.view, "usps")
    }
    
}
