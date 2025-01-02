//
//  MergeSortedArraysTest.swift
//  swift-algorithms-data-structuresTests
//
//  Created by Amin faruq on 02/01/25.
//

import XCTest
@testable import swift_algorithms_data_structures

final class MergeSortedArraysTest: XCTestCase {

    func test_mergeSortedArray_returnEmptyIfNoInput() {
        let sut = mergeSortedArray(first: [], last: [])
        
        XCTAssertEqual(sut, [])
    }
    
    func test_mergeSortedArray_ifJustFirst() {
        let sut = mergeSortedArray(first: [0,3,4,31], last: [])
        
        XCTAssertEqual(sut, [0,3,4,31])
    }
    
    func test_mergeSortedArray_ifJustLast() {
        let sut = mergeSortedArray(first: [], last: [4,6,30])
        
        XCTAssertEqual(sut, [4,6,30])
    }
    
    func test_mergeSortedArray_shouldMergeAndSort() {
        let sut = mergeSortedArray(first: [0,3,4,31], last: [4,6,30])
        
        XCTAssertEqual(sut, [0,3,4,4,6,30,31])
    }
}
