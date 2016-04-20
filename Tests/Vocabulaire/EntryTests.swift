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
    
    #if swift(>=3.0)
    let notAllowed = ForeignLexeme.Permissibility.notAllowed
    let allowed = ForeignLexeme.Permissibility.allowed
    let general = NativeLexeme.Usage.general
    let promising = NativeLexeme.Usage.promising
    let rare = NativeLexeme.Usage.rare
    #else
    let notAllowed = ForeignLexeme.Permissibility.NotAllowed
    let allowed = ForeignLexeme.Permissibility.Allowed
    let general = NativeLexeme.Usage.General
    let promising = NativeLexeme.Usage.Promising
    let rare = NativeLexeme.Usage.Rare
    #endif
    
    func entry(forName name: Morpheme, permissibility: ForeignLexeme.Permissibility) -> Entry {
        let foreign = ForeignLexeme(lemma: name, forms: [], origin: name, meaning: "", permissibility: permissibility)
        return Entry(id: 1, foreign: foreign, natives: [])
    }

    func testSort() {
        let foreign = ForeignLexeme(lemma: Morpheme("Manager"),
                                    forms: [],
                                    origin: Morpheme("manager"),
                                    meaning: "A head of something",
                                    permissibility: notAllowed)
        let native1 = NativeLexeme(lemma: Morpheme("Управляющий"),
                                   meaning: "",
                                   usage: general)
        let native2 = NativeLexeme(lemma: Morpheme("Главный"),
                                   meaning: "",
                                   usage: promising)
        let native3 = NativeLexeme(lemma: Morpheme("Заведующий"),
                                   meaning: "",
                                   usage: rare)
        let natives: Set = [native1, native2, native3]
        let entry = Entry(id: 1, foreign: foreign, natives: natives)
        let sortedNatives = entry.nativesByUsage
        XCTAssertEqual(sortedNatives, [native1, native2, native3])
    }
    
    func testWrongSort() {
        let foreign = ForeignLexeme(lemma: Morpheme("Manager"),
                                    forms: [],
                                    origin: Morpheme("manager"),
                                    meaning: "A head of something",
                                    permissibility: notAllowed)
        let native1 = NativeLexeme(lemma: Morpheme("Управляющий"),
                                   meaning: "",
                                   usage: general)
        let native2 = NativeLexeme(lemma: Morpheme("Главный"),
                                   meaning: "",
                                   usage: promising)
        let native3 = NativeLexeme(lemma: Morpheme("Заведующий"),
                                   meaning: "",
                                   usage: rare)
        let natives: Set = [native1, native2, native3]
        let entry = Entry(id: 2, foreign: foreign, natives: natives)
        let sortedNatives = entry.nativesByUsage
        XCTAssertNotEqual(sortedNatives, [native3, native2, native1])
        XCTAssertNotEqual(sortedNatives, [native2, native1, native3])
    }
    
    #if swift(>=3.0)
    let caseSensitive = Morpheme.Kind.caseSensitive
    #else
    let caseSensitive = Morpheme.Kind.CaseSensitive
    #endif
    
    func testAlphabeticalVocabulary() {
        let entry1 = entry(forName: Morpheme("менеджер"), permissibility: notAllowed)
        let entry2 = entry(forName: Morpheme("нонпрофит"), permissibility: notAllowed)
        let entry3 = entry(forName: Morpheme("баг"), permissibility: allowed)
        let entry4 = entry(forName: Morpheme("США", type: caseSensitive), permissibility: notAllowed)
        let vocabulary: Vocabulary = [entry1, entry2, entry3, entry4]
        let sorted = vocabulary.alphabetical
        XCTAssertEqual(sorted, [entry3, entry1, entry2, entry4] as Vocabulary)
    }

}
