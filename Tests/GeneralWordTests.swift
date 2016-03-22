//
//  WordsTests.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 22.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import XCTest
@testable import Vocabulaire

class GeneralWordTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEquality() {
        let firstWord: GeneralWord = "hello"
        let secondWord: GeneralWord = "Hello"
        XCTAssertEqual(firstWord, secondWord)
        XCTAssertTrue(firstWord == secondWord)
    }
    
    func testInequality() {
        let firstWord: GeneralWord = "hello"
        let secondWord = GeneralWord(string: "swift")
        XCTAssertNotEqual(firstWord, secondWord)
    }
    
    func testViews() {
        let word: GeneralWord = "macIntosh"
        XCTAssertEqual(word.lowercase, "macintosh")
        XCTAssertEqual(word.view, "Macintosh")
        XCTAssertEqual(word.uppercase, "MACINTOSH")
        XCTAssertEqual(word.description, "Macintosh")
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
