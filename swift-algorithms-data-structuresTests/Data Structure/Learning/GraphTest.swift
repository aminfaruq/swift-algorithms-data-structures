//
//  GraphTest.swift
//  swift-algorithms-data-structuresTests
//
//  Created by Amin faruq on 18/01/25.
//

import XCTest
@testable import swift_algorithms_data_structures

final class GraphTest: XCTestCase {
    
    var graph: Graph<String>!
    
    override func setUp() {
        super.setUp()
        graph = Graph<String>() // Initialize a new graph before each test
    }
    
    override func tearDown() {
        graph = nil // Clean up after each test
        super.tearDown()
    }
    
    func testAddVertex() {
        graph.addVertex("A")
        graph.addVertex("B")
        XCTAssertEqual(graph.showConnections().sorted(), ["A --> ", "B --> "].sorted())
    }
    
    func testAddEdge() {
        graph.addVertex("A")
        graph.addVertex("B")
        graph.addEdge("A", "B")
        XCTAssertEqual(graph.showConnections().sorted(), ["A --> B", "B --> A"].sorted())
    }
    
    func testShowConnections() {
        graph.addVertex("A")
        graph.addVertex("B")
        graph.addVertex("C")
        graph.addEdge("A", "B")
        graph.addEdge("A", "C")
        XCTAssertEqual(graph.showConnections().sorted(), ["A --> B C", "B --> A", "C --> A"].sorted())
    }
}
