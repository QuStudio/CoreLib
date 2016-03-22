//
//  EntryTests.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 22.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

import XCTest
@testable import Vocabulaire

class EntryTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSort() {
        let foreign = ForeignLexeme(lemma: GeneralWord(string: "Manager"),
                                    forms: nil,
                                    origin: GeneralWord(string: "manager"),
                                    meaning: "A head of something",
                                    permissibility: .NotAllowed)
        let native1 = NativeLexeme(lemma: GeneralWord(string: "Управляющий"),
                                   meaning: "",
                                   usage: .General)
        let native2 = NativeLexeme(lemma: GeneralWord(string: "Главный"),
                                   meaning: "",
                                   usage: .Promising)
        let native3 = NativeLexeme(lemma: GeneralWord(string: "Заведующий"),
                                   meaning: "",
                                   usage: .Rare)
        let natives: Set = [native1, native2, native3]
        let entry = Entry(foreign: foreign, natives: natives)
        let sortedNatives = entry.nativesByUsage
        XCTAssertEqual(sortedNatives, [native1, native2, native3])
    }
    
    func testWrongSort() {
        let foreign = ForeignLexeme(lemma: GeneralWord(string: "Manager"),
                                    forms: nil,
                                    origin: GeneralWord(string: "manager"),
                                    meaning: "A head of something",
                                    permissibility: .NotAllowed)
        let native1 = NativeLexeme(lemma: GeneralWord(string: "Управляющий"),
                                   meaning: "",
                                   usage: .General)
        let native2 = NativeLexeme(lemma: GeneralWord(string: "Главный"),
                                   meaning: "",
                                   usage: .Promising)
        let native3 = NativeLexeme(lemma: GeneralWord(string: "Заведующий"),
                                   meaning: "",
                                   usage: .Rare)
        let natives: Set = [native1, native2, native3]
        let entry = Entry(foreign: foreign, natives: natives)
        let sortedNatives = entry.nativesByUsage
        XCTAssertNotEqual(sortedNatives, [native3, native2, native1])
    }

}