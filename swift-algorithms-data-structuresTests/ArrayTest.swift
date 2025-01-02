//
//  ArrayTest.swift
//  swift-algorithms-data-structuresTests
//
//  Created by Amin faruq on 02/01/25.
//

import XCTest
@testable import swift_algorithms_data_structures

final class ArrayTest: XCTestCase {
    var sut: MyArray!
    
    override func setUp() {
        super.setUp()
        sut = MyArray()
    }
    
    func test_pushAndGetIndex() {
        _ = sut.push(item: "hi")
        _ = sut.push(item: "you")
        
        XCTAssertEqual(sut.get(index: 0) as? String, "hi", "First item should be 'hi'")
        XCTAssertEqual(sut.get(index: 1) as? String, "you", "Second item should be 'you'")
    }
    
    func test_popRemovesLastElement() {
        _ = sut.push(item: "hi")
        _ = sut.push(item: "you")
        
        let poppedItem = sut.pop()
        
        XCTAssertEqual(poppedItem as? String, "you", "Popped item should be 'you'")
        XCTAssertEqual(sut.get(index: 0) as? String, "hi", "Remaining item should be 'hi'")
        XCTAssertNil(sut.get(index: 1), "No item should exist at index 1")
    }
    
    func test_deleteRemovesElementAtIndex() {
        _ = sut.push(item: "hi")
        _ = sut.push(item: "you")
        
        let deletedItem = sut.delete(at: 0)
        
        XCTAssertEqual(deletedItem as? String, "hi", "Deleted item should be 'hi'")
        XCTAssertEqual(sut.get(index: 0) as? String, "you", "Remaining item should be 'you'")
        XCTAssertNil(sut.get(index: 1), "No item should exist at index 1")
    }
    
    func test_deleteOutOfBounds() {
        _ = sut.push(item: "hi")
        let deletedItem = sut.delete(at: 5)
        
        XCTAssertNil(deletedItem, "Deleting out of bounds should return nil")
    }
    
    func test_popFromEmptyArray() {
        let poppedItem = sut.pop()
        XCTAssertNil(poppedItem, "Popping from an empty array should return nil")
    }
    
    func test_getOutOfBounds() {
        _ = sut.push(item: "hi")
        let item = sut.get(index: 5)
        
        XCTAssertNil(item, "Getting out of bounds should return nil")
    }
}
