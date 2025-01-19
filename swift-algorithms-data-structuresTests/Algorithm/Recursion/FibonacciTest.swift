//
//  FibonacciTest.swift
//  swift-algorithms-data-structuresTests
//
//  Created by Amin faruq on 19/01/25.
//

import XCTest
@testable import swift_algorithms_data_structures

final class FibonacciTest: XCTestCase {
    
    func test_fibonacciRecursive_returnNumberIf0or1() {
        XCTAssertEqual(fibonacciRecursive(0), 0)
        XCTAssertEqual(fibonacciRecursive(1), 1)
    }
    
    func test_fibonacciRecursive_ExpectedNumber() {
        XCTAssertEqual(fibonacciRecursive(2), 1)
        XCTAssertEqual(fibonacciRecursive(3), 2)
        XCTAssertEqual(fibonacciRecursive(4), 3)
        XCTAssertEqual(fibonacciRecursive(5), 5)
        XCTAssertEqual(fibonacciRecursive(6), 8)
        XCTAssertEqual(fibonacciRecursive(7), 13)
        XCTAssertEqual(fibonacciRecursive(8), 21)
    }
    
    func test_fibonacciIterative() {
        XCTAssertEqual(fibonacciIterative(2), 1)
        XCTAssertEqual(fibonacciIterative(3), 2)
        XCTAssertEqual(fibonacciIterative(4), 3)
        XCTAssertEqual(fibonacciIterative(5), 5)
        XCTAssertEqual(fibonacciIterative(6), 8)
        XCTAssertEqual(fibonacciIterative(7), 13)
        XCTAssertEqual(fibonacciIterative(8), 21)
    }
}
