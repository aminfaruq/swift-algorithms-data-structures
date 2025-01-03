//
//  HashTableTest.swift
//  swift-algorithms-data-structuresTests
//
//  Created by Amin faruq on 03/01/25.
//

import XCTest
@testable import swift_algorithms_data_structures

final class HashTableTest: XCTestCase {
    
    func test_inputAndGet() {
        let sut = HashTable(size: 50)
        
        sut.set("grapes", 1000)
        sut.set("apple", 5000)
        
        XCTAssertEqual(sut.get("grapes"), 1000)
        XCTAssertEqual(sut.get("apple"), 5000)
        XCTAssertNil(sut.get("Guava"), "Should nil if didn't have")
    }
}
