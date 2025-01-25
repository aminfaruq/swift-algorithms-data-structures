//
//  InsertionSortTest.swift
//  swift-algorithms-data-structuresTests
//
//  Created by Amin faruq on 25/01/25.
//

import XCTest
@testable import swift_algorithms_data_structures

final class InsertionSortTest: XCTestCase {
    
    func test_insertionSort() {
           // Test case: unsorted array
           var numbers = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4]
           
           insertionSort(&numbers) // Sort the array
           
           // Assert that the result matches the expected sorted array
           XCTAssertEqual(numbers, [1, 2, 4, 5, 6, 44, 63, 87, 99, 283])
       }
   
}
