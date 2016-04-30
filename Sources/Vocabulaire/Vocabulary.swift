//
//  Vocabulaire.swift
//  Vocabulaire
//
//  Created by Oleg Dreyman on 23.03.16.
//  Copyright © 2016 Oleg Dreyman. All rights reserved.
//

/// An array of entrues.
public typealias Vocabularee = [Entry]

public struct Vocabulary {
    private var entries: [Entry]
    public let version: Version
    public init(version: Version, entries: [Entry] = []) {
        self.entries = entries
        self.version = version
    }
    
    public struct Version {
        let major: Int
        let minor: Int
        let patch: Int
        public static var develop: Version {
            return Version(major: 0, minor: 0, patch: 0)
        }
    }
}

#if swift(>=3.0)
    typealias MutableCollectionProtocol = MutableCollection
#else
    typealias MutableCollectionProtocol = MutableCollectionType
#endif

extension Vocabulary: MutableCollectionProtocol {
    public typealias Element = Entry
    public typealias Index = Int
    public var endIndex: Int {
        return entries.endIndex
    }
    public var startIndex: Int {
        return entries.startIndex
    }
    public subscript(position: Int) -> Entry {
        get {
            return entries[position]
        }
        set(entry) {
            entries[position] = entry
        }
    }
    #if swift(>=3.0)
        public func makeIterator() -> IndexingIterator<[Entry]> {
            return entries.makeIterator()
        }
    #else
        public func generate() -> IndexingGenerator<[Entry]> {
            return entries.generate()
        }
    #endif
}

extension Vocabulary {
    var alphabetical: [Entry] {
        #if swift(>=3.0)
            return self.sorted { $0.foreign.lemma.view < $1.foreign.lemma.view }
        #else
            return self.sort({ $0.foreign.lemma.view < $1.foreign.lemma.view })
        #endif
    }
}
