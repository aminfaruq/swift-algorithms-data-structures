//
//  DoublyLinkedList.swift
//  swift-algorithms-data-structures
//
//  Created by Phincon on 09/01/25.
//

import Foundation

class DoublyLinkedList {
    // Node class represents an element in the linked list
    class Node {
        var value: Int // Value of the node
        var next: Node? // Reference to the next node
        var previous: Node? // Reference to the previous node
        
        init(value: Int) {
            self.value = value
            self.next = nil
            self.previous = nil
        }
    }
    
    var head: Node?
    var tail: Node?
    var length: Int = 0
    
    // Initialize the linked list with the first node
    init(_ value: Int) {
        let newNode = Node(value: value)
        self.head = newNode
        self.tail = newNode
        self.length = 1
    }
    
    @discardableResult
    func append(_ value: Int) -> DoublyLinkedList {
        let newNode = Node(value: value)
        newNode.previous = tail
        tail?.next = newNode
        tail = newNode
        length += 1
        return self
    }
    
    @discardableResult
    func prepend(_ value: Int) -> DoublyLinkedList {
        let newNode = Node(value: value)
        newNode.next = head
        head?.previous = newNode
        head = newNode
        
        if length == 0 {
            tail = newNode
        }
        length += 1
        return self
    }
    
    @discardableResult
    func insert(_ index: Int, _ value: Int) -> [Int] {
        if index >= length {
            append(value)
            return printList()
        }
        
        let newNode = Node(value: value)
        if index == 0 {
            prepend(value)
            return printList()
        }
        
        let leader = traverseToIndex(index - 1)
        let follower = leader?.next
        leader?.next = newNode
        newNode.previous = leader
        newNode.next = follower
        follower?.previous = newNode
        
        length += 1
        return printList()
    }

}

//MARK: - Helpers -
extension DoublyLinkedList {
    
    // Print all node values in the list as an array
    func printList() -> [Int] {
        var array: [Int] = [] // Array to store node values
        var currentNode = head // Start from the head
        while let node = currentNode { // Traverse until the end of the list
            array.append(node.value) // Add node value to the array
            currentNode = node.next // Move to the next node
        }
        return array // Return the array of values
    }
    
    // Get the value of the node at a specific index
    func getNode(_ index: Int) -> Int? {
        guard let node = traverseToIndex(index) else { return nil } // Get the node at the index
        return node.value // Return the node's value
    }
    
    // Traverse to a specific index in the linked list
    private func traverseToIndex(_ index: Int) -> Node? {
        guard index >= 0 && index < length else { return nil } // Ensure index is valid
        var currentNode = head // Start from the head
        var counter = 0 // Counter to track the current position
        while counter != index { // Traverse until the target index
            currentNode = currentNode?.next // Move to the next node
            counter += 1
        }
        return currentNode // Return the node at the target index
    }
    
    func showNodes() -> String {
        var currentNode = head // Start from the head of the list
        var result: [String] = [] // Array to collect node information
        
        while let node = currentNode { // Traverse until the end of the list
            let prevValue = node.previous?.value ?? -404 // Get previous node's value or "nil"
            let nextValue = node.next?.value ?? -404 // Get next node's value or "nil"
            
            let prevValueString = (String(prevValue) == "-404") ? "nil" : "\(prevValue)"
            let nextValueString = (String(nextValue) == "-404") ? "nil" : "\(nextValue)"
            
            result.append("[Prev: \(prevValueString), Value: \(node.value), Next: \(nextValueString)]") // Append node details
            currentNode = node.next // Move to the next node
        }
        
        // Print the collected node information
        return result.joined(separator: " -> ")
    }
}
