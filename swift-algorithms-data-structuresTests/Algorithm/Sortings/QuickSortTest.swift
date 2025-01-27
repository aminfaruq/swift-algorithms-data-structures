//
//  QuickSortTest.swift
//  swift-algorithms-data-structuresTests
//
//  Created by Amin faruq on 27/01/25.
//

import XCTest
@testable import swift_algorithms_data_structures

final class QuickSortTest: XCTestCase {

    func test_quickSort() {
        // Test case: unsorted array
        var numbers = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4]
        
        let sortedNumbers = quickSort(&numbers, 0, numbers.count - 1)

        // Assert that the result matches the expected sorted array
        XCTAssertEqual(sortedNumbers, [1, 2, 4, 5, 6, 44, 63, 87, 99, 283])
    }

}
