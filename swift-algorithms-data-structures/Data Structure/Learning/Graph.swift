//
//  Graph.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 18/01/25.
//

import Foundation

// Generic Graph class that works with any hashable type T
class Graph<T: Hashable> {
    // Number of nodes in the graph
    private var numberOfNodes: Int
    // Adjacency list to store connections between nodes
    private var adjacentList: [T: [T]]
    
    // Initialize an empty graph
    init() {
        self.numberOfNodes = 0 // Start with zero nodes
        self.adjacentList = [:] // Empty adjacency list
    }
    
    // Add a new vertex to the graph
    func addVertex(_ node: T) {
        // Check if the node already exists in the adjacency list
        if adjacentList[node] == nil {
            adjacentList[node] = [] // Initialize with an empty array of connections
            numberOfNodes += 1 // Increment the number of nodes
        }
    }
    
    // Add an undirected edge between two nodes
    func addEdge(_ node1: T, _ node2: T) {
        // Add node2 to the adjacency list of node1 if not already present
        if adjacentList[node1] != nil, !adjacentList[node1]!.contains(node2) {
            adjacentList[node1]!.append(node2)
        }
        
        // Add node1 to the adjacency list of node2 if not already present
        if adjacentList[node2] != nil, !adjacentList[node2]!.contains(node1) {
            adjacentList[node2]!.append(node1)
        }
    }
    
    // Display all the connections in the graph
    func showConnections() -> [String] {
        var connections: [String] = []
        // Iterate over all nodes in the adjacency list
        for (node, adjacentNodes) in adjacentList {
            // Create a string of all connections for the current node
            let connectionString = adjacentNodes.map { "\($0)" }.joined(separator: " ")
            connections.append("\(node) --> \(connectionString)")
        }
        return connections
    }
}
