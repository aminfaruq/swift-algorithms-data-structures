//
//  LinkedListTest.swift
//  swift-algorithms-data-structuresTests
//
//  Created by Amin faruq on 19/12/24.
//

import XCTest
@testable import swift_algorithms_data_structures

final class LinkedListTest: XCTestCase {
    
    func test_initialize() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.getNode(0), 1)
        XCTAssertEqual(sut.printList(), [1])
    }
    
    func test_append_toEmptyList() {
        let sut = makeSUT()
        
        sut.append(2)
        
        XCTAssertEqual(sut.getNode(1), 2)
        XCTAssertEqual(sut.printList(), [1,2])
    }
    
    func test_prepend() {
        let sut = makeSUT()
        
        sut.prepend(10)
        sut.append(2)
        
        XCTAssertEqual(sut.getNode(0), 10)
        XCTAssertEqual(sut.printList(), [10,1,2])
    }
    
    func test_insert() {
        let sut = makeSUT()
        
        sut.prepend(0) // (0),1
        sut.append(3) // 0,1,(3)
        sut.insert(2, 2) // 0, 1, (2), 3
        
        XCTAssertEqual(sut.getNode(0), 0)
        XCTAssertEqual(sut.printList(), [0,1,2,3])
    }
    
    func test_remove() {
        let sut = makeSUT()
        
        sut.prepend(0) // 0, 1
        sut.append(3) // 0, 1, 3
        sut.insert(2, 2) // 0, 1, 2, 3
        sut.remove(3) // 0,1,2
        
        XCTAssertEqual(sut.getNode(0), 0)
        XCTAssertEqual(sut.printList(), [0,1,2])
    }
    
    func test_remove_onEmptyList() {
        let sut = makeSUT()
        
        sut.append(2)
        sut.remove(1)
        
        XCTAssertNil(sut.getNode(1))
        XCTAssertEqual(sut.printList(), [1])
    }
    
    func test_insert_withInvalidIndex() {
        let sut = makeSUT()
        
        sut.insert(3, 99)
        
        XCTAssertEqual(sut.printList(), [1,99])
    }
    
    func test_getNode_outOfBounds() {
        let sut = makeSUT()
        
        sut.append(5)
        
        XCTAssertNil(sut.getNode(2))
    }
    
    //MARK: Helper
    func makeSUT() -> LinkedList {
        return LinkedList(1)
    }
    
}
