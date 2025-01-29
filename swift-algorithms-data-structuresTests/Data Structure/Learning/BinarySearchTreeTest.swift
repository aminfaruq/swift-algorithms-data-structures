//
//  BinarySearchTreeTest.swift
//  swift-algorithms-data-structuresTests
//
//  Created by Amin faruq on 17/01/25.
//

import XCTest
@testable import swift_algorithms_data_structures

final class BinarySearchTreeTest: XCTestCase {
    
    func test_lookupNodeExists() {
        let bst = BinarySearchTree<Int>()
        bst.insert(10)
        bst.insert(5)
        bst.insert(15)
        bst.insert(3)
        bst.insert(7)
        
        let foundNode = bst.lookup(7)
        XCTAssertNotNil(foundNode, "The node with value 7 should exist in the tree.")
        XCTAssertEqual(foundNode?.value, 7, "The node's value should be 7.")
    }
    
    func test_lookupNodeDoesNotExist() {
        let bst = BinarySearchTree<Int>()
        bst.insert(10)
        bst.insert(5)
        bst.insert(15)
        
        let foundNode = bst.lookup(20)
        XCTAssertNil(foundNode, "The node with value 20 should not exist in the tree.")
    }
    
    func test_LookupInEmptyTree() {
        let bst = BinarySearchTree<Int>()
        
        let foundNode = bst.lookup(10)
        XCTAssertNil(foundNode, "Lookup in an empty tree should return nil.")
    }
    
    func test_LookupRootNode() {
        let bst = BinarySearchTree<Int>()
        bst.insert(10)
        
        let foundNode = bst.lookup(10)
        XCTAssertNotNil(foundNode, "The root node with value 10 should exist.")
        XCTAssertEqual(foundNode?.value, 10, "The root node's value should be 10.")
    }
    
    func test_insertAndRemove() {
        let bst = BinarySearchTree<Int>()
        bst.insert(10)
        bst.insert(5)
        bst.insert(15)
        bst.insert(3)
        bst.insert(7)
        
        let foundNode = bst.lookup(7)
        XCTAssertNotNil(foundNode, "The node with value 7 should exist in the tree.")
        XCTAssertEqual(foundNode?.value, 7, "The node's value should be 7.")
        
        let result = bst.remove(7)
        XCTAssertTrue(result, "Should return true, if the node with value 5 was successfully removed")
        
        let lookupResult = bst.lookup(7)
        XCTAssertNil(lookupResult)
    }
    
    func test_breadFirstSearch() {
        let bst = BinarySearchTree<Int>()
        bst.insert(9)
        bst.insert(4)
        bst.insert(6)
        bst.insert(20)
        bst.insert(170)
        bst.insert(15)
        bst.insert(1)
        
        XCTAssertEqual(bst.breadFirstSearch(), [9, 4, 20, 1, 6, 15, 170])
    }
}
