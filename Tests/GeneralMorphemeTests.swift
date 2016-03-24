//
//  WordsTests.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 22.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import XCTest
@testable import Vocabulaire

class GeneralMorphemeTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEqual() {
        let firstWord: GeneralMorpheme = "hello"
        let secondWord: GeneralMorpheme = "Hello"
        XCTAssertEqual(firstWord, secondWord)
        XCTAssertTrue(firstWord == secondWord)
    }
    
    func testNotEqual() {
        let firstWord: GeneralMorpheme = "hello"
        let secondWord = GeneralMorpheme("swift")
        XCTAssertNotEqual(firstWord, secondWord)
    }
    
    func testViews() {
        let word: GeneralMorpheme = "macIntosh"
        XCTAssertEqual(word.lowercase, "macintosh")
        XCTAssertEqual(word.view, "Macintosh")
        XCTAssertEqual(word.uppercase, "MACINTOSH")
        XCTAssertEqual(word.description, "Macintosh")
    }

}
