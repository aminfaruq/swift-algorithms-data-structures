//
//  DoublyLinkedListTest.swift
//  swift-algorithms-data-structuresTests
//
//  Created by Phincon on 09/01/25.
//

import XCTest
@testable import swift_algorithms_data_structures

final class DoublyLinkedListTest: XCTestCase {
    
    func test_initialized() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.getNode(0), 1)
        XCTAssertEqual(sut.printList(), [1])
    }
    
    func test_append() {
        let sut = makeSUT()
        
        sut.append(2)
        sut.append(3)
        
        XCTAssertEqual(sut.showNodes(), "[Prev: nil, Value: 1, Next: 2] -> [Prev: 1, Value: 2, Next: 3] -> [Prev: 2, Value: 3, Next: nil]")
    }
    
    func test_prepend() {
        let sut = makeSUT()
        
        sut.prepend(0)
        
        XCTAssertEqual(sut.showNodes(), "[Prev: nil, Value: 0, Next: 1] -> [Prev: 0, Value: 1, Next: nil]")
    }
    
    //MARK: Helper
    func makeSUT() -> DoublyLinkedList {
        return DoublyLinkedList(1)
    }
}
