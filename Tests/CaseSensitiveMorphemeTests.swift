//
//  CaseSensitiveWordTests.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 22.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import XCTest
@testable import Vocabulaire

class CaseSensitiveMorphemeTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testViewEqual() {
        let word: CaseSensitiveMorpheme = "USA"
        XCTAssertEqual(word.view, "USA")
    }
    
    func testTwoWordsEqual() {
        let first: CaseSensitiveMorpheme = "NYPD"
        let second: CaseSensitiveMorpheme = "NYPD"
        XCTAssertTrue(first == second)
    }
    
    func testTwoWordsNotEqual() {
        let first: CaseSensitiveMorpheme = "AAPL"
        let second: CaseSensitiveMorpheme = "aaPl"
        XCTAssertFalse(first == second)
    }
    
    func testViewNotEqual() {
        let word = CaseSensitiveMorpheme("USPS")
        XCTAssertNotEqual(word.view, "usps")
    }
    
}
