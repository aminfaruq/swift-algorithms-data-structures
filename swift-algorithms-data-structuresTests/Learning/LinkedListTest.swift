//
//  LinkedListTest.swift
//  swift-algorithms-data-structuresTests
//
//  Created by Amin faruq on 19/12/24.
//

import XCTest
@testable import swift_algorithms_data_structures

final class LinkedListTest: XCTestCase {
    
    var n1: Node!
    var n2: Node!
    var n3: Node!
    var n4: Node!
    var linkedList: LinkedList!
    
    override func setUp() {
        super.setUp()
        
        n1 = Node(value: 1)
        n2 = Node(value: 2)
        n3 = Node(value: 3)
        n4 = Node(value: 4)
        
        linkedList = LinkedList(head: n1)
        linkedList.append(n2)
        linkedList.append(n3)
    }
    
    override func tearDown() {
        // remove property when done
        n1 = nil
        n2 = nil
        n3 = nil
        n4 = nil
        linkedList = nil
        
        super.tearDown()
    }
    
    func test_getNode() {
        XCTAssertEqual(linkedList.head?.next?.next?.value, 3)
        XCTAssertEqual(linkedList.getNode(atPosition: 3)?.value, 3)
    }
    
    func test_insertNode() {
        linkedList.insertNode(n4, at: 3)
        
        XCTAssertEqual(linkedList.getNode(atPosition: 3)?.value, 4)
    }
    
    func test_deleteNode() {
        linkedList.deleteNode(withValue: 1)
        
        XCTAssertEqual(linkedList.getNode(atPosition: 1)?.value, 2)
        XCTAssertEqual(linkedList.getNode(atPosition: 2)?.value, 3)
        XCTAssertEqual(linkedList.getNode(atPosition: 3)?.value, nil)
    }
    
    func test_prepend() {
        linkedList.prepend(Node(value: 12))
        
        XCTAssertEqual(linkedList.getNode(atPosition: 1)?.value, 12)
    }
    
    func test_append() {
        linkedList.append(n4)
        
        XCTAssertEqual(linkedList.getNode(atPosition: 4)?.value, 4)
    }
    
    func test_printList() {
        linkedList.append(n4)
        linkedList.append(Node(value: 5))
        
        XCTAssertEqual(linkedList.printList(), [1,2,3,4,5])
    }
}
