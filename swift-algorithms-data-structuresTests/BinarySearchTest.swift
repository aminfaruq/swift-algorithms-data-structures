//
//  BinarySearchTest.swift
//  swift-algorithms-data-structuresTests
//
//  Created by Amin faruq on 14/12/24.
//

import XCTest
@testable import swift_algorithms_data_structures

final class BinarySearchTest: XCTestCase {
    
    func test_binarySearchInt() {
        let array = [1,5,18,32,33,33,47,49,502]
        
        XCTAssertEqual(array.binarySearch(for: 5), 1)
        XCTAssertEqual(array.binarySearch(for: 33), 4)
    }
    
    func test_binarySearchString() {
        let array = ["apple", "banana", "cherry", "date", "fig", "grape"]
        
        XCTAssertEqual(array.binarySearch(for: "cherry"), 2)
    }
}
