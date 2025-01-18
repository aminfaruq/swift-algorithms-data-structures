//
//  LinkedList.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 19/12/24.
//

class LinkedList {
    // Node class represents an element in the linked list
    class Node {
        var value: Int // Value of the node
        var next: Node? // Reference to the next node
        
        init(value: Int) {
            self.value = value
            self.next = nil
        }
    }
    
    var head: Node? // First node in the list
    var tail: Node? // Last node in the list
    var length: Int = 0 // Number of nodes in the list
    
    // Initialize the linked list with the first node
    init(_ value: Int) {
        let newNode = Node(value: value)
        self.head = newNode
        self.tail = newNode
        self.length = 1
    }
    
    // Add a node to the end of the linked list
    func append(_ value: Int)  {
        let newNode = Node(value: value)
        tail?.next = newNode // Link the current tail to the new node
        tail = newNode // Update the tail to the new node
        length += 1 // Increment the length of the list
    }
    
    // Add a node to the start of the linked list
    func prepend(_ value: Int)  {
        let newNode = Node(value: value)
        newNode.next = head // Link the new node to the current head
        head = newNode // Update the head to the new node
        if length == 0 { // If the list was empty, update the tail as well
            tail = newNode
        }
        length += 1 // Increment the length of the list
    }
    
    // Insert a new node at a specific index
    func insert(_ index: Int, _ value: Int) {
        if index >= length { // If index is greater than or equal to length, append the value
            append(value)
        }
        
        let newNode = Node(value: value)
        if index == 0 { // If inserting at the start, use prepend
            prepend(value)
        }
        
        let leader = traverseToIndex(index - 1) // Get the node before the target index
        let holdingPointer = leader?.next // Save the next node
        leader?.next = newNode // Link the leader to the new node
        newNode.next = holdingPointer // Link the new node to the next node
        length += 1 // Increment the length
    }
    
    // Remove a node at a specific index
    func remove(_ index: Int)  {
        guard index > 0 && index < length else { return } // Ensure valid index
        let leader = traverseToIndex(index - 1) // Get the node before the target index
        let unwantedNode = leader?.next // The node to be removed
        leader?.next = unwantedNode?.next // Link the leader to the node after the unwanted node
        if index == length - 1 { // If removing the last node, update the tail
            tail = leader
        }
        length -= 1 // Decrement the length
    }
}

//MARK: - Helpers -
extension LinkedList {
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
    
    // Get the value of the node at a specific index
    func getNode(_ index: Int) -> Int? {
        guard let node = traverseToIndex(index) else { return nil } // Get the node at the index
        return node.value // Return the node's value
    }
}
