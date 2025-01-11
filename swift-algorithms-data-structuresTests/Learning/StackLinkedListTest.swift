//
//  StackLinkedListTest.swift
//  swift-algorithms-data-structuresTests
//
//  Created by Amin faruq on 11/01/25.
//

import XCTest
@testable import swift_algorithms_data_structures

final class StackLinkedListTest: XCTestCase {

    var stack = StackLinkedList<Int>()
    
    func test_stack_isEmpty() {
        XCTAssertTrue(stack.isEmpty)
        XCTAssertNil(stack.peek())
        XCTAssertEqual(stack.printList(), [])
    }
    
    func test_stack_push() {
        stack.push(1)
        stack.push(2)
        
        XCTAssertEqual(stack.size, 2)
        XCTAssertEqual(stack.peek(), 2)
        XCTAssertEqual(stack.printList(), [2, 1])
    }
    
    func test_stack_pop() {
        stack.push(1)
        stack.push(2)
        
        stack.pop()
        
        XCTAssertEqual(stack.size, 1)
        XCTAssertEqual(stack.peek(), 1)
        XCTAssertEqual(stack.printList(), [1])
    }
}
