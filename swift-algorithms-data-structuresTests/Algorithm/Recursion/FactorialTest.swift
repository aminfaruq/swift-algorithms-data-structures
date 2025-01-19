//
//  FactorialTest.swift
//  swift-algorithms-data-structuresTests
//
//  Created by Amin faruq on 19/01/25.
//

import XCTest
@testable import swift_algorithms_data_structures

final class FactorialTest: XCTestCase {
    
    func test_findFactorialRecursive() {
        XCTAssertEqual(findFactorialRecursive(1), 1)
        XCTAssertEqual(findFactorialRecursive(2), 2)
        XCTAssertEqual(findFactorialRecursive(3), 6)
        XCTAssertEqual(findFactorialRecursive(4), 24)
        XCTAssertEqual(findFactorialRecursive(5), 120)
    }
    
    func test_findFactorialIterative() {
        XCTAssertEqual(findFactorialIterative(1), 1)
        XCTAssertEqual(findFactorialIterative(2), 2)
        XCTAssertEqual(findFactorialIterative(3), 6)
        XCTAssertEqual(findFactorialIterative(4), 24)
        XCTAssertEqual(findFactorialIterative(5), 120)
    }
    
}
