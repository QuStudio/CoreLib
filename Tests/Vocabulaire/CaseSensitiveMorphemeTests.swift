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
    
    #if swift(>=3.0)
    let caseSensitive = Morpheme.Kind.caseSensitive
    #else
    let caseSensitive = Morpheme.Kind.CaseSensitive
    #endif

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testViewEqual() {
        let word = Morpheme("USA", type: caseSensitive)
        XCTAssertEqual(word.view, "USA")
    }
    
    func testTwoWordsEqual() {
        let first = Morpheme("NYPD", type: caseSensitive)
        let second = Morpheme("NYPD", type: caseSensitive)
        XCTAssertTrue(first == second)
    }
    
    func testTwoWordsNotEqual() {
        let first = Morpheme("AAPL", type: caseSensitive)
        let second = Morpheme("aaPL", type: caseSensitive)
        XCTAssertFalse(first == second)
    }
    
    func testViewNotEqual() {
        let word = Morpheme("USPS", type: caseSensitive)
        XCTAssertNotEqual(word.view, "usps")
    }
    
}
