//
//  SelectionSortTest.swift
//  swift-algorithms-data-structuresTests
//
//  Created by Amin faruq on 22/01/25.
//

import XCTest
@testable import swift_algorithms_data_structures

final class SelectionSortTest: XCTestCase {

    func test_selectionSort() {
        var numbers = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0];
        
        selectionSort(&numbers)
        
        XCTAssertEqual(numbers, [0, 1, 2, 4, 5, 6, 44, 63, 87, 99, 283])
    }
}
