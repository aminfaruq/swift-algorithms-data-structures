//
//  MergeSortTest.swift
//  swift-algorithms-data-structuresTests
//
//  Created by Amin faruq on 26/01/25.
//

import XCTest
@testable import swift_algorithms_data_structures

final class MergeSortTest: XCTestCase {
    
    func test_mergeSort() {
        // Test case: unsorted array
        let numbers = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4]
        
        let answers = mergeSort(numbers) // Sort the array
        
        // Assert that the result matches the expected sorted array
        XCTAssertEqual(answers, [1, 2, 4, 5, 6, 44, 63, 87, 99, 283])
    }
}
