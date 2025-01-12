//
//  DoublyLinkedList.swift
//  swift-algorithms-data-structures
//
//  Created by Phincon on 09/01/25.
//

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
    
    func append(_ value: Int) {
        let newNode = Node(value: value) // Create a new node with the given value
        newNode.previous = tail // Link the new node's previous reference to the current tail
        tail?.next = newNode // Link the current tail's next reference to the new node
        tail = newNode // Update the tail to point to the new node
        length += 1 // Increment the length of the linked list
    }
    
    func prepend(_ value: Int) {
        let newNode = Node(value: value) // Create a new node with the given value
        newNode.next = head // Link the new node's next reference to the current head
        head?.previous = newNode // Link the current head's previous reference to the new node
        head = newNode // Update the head to point to the new node
        
        if length == 0 { // If the list was empty, the new node is also the tail
            tail = newNode
        }
        length += 1 // Increment the length of the linked list
    }
    
    func insert(_ index: Int, _ value: Int) {
        if index >= length { // If the index is out of bounds (end of the list), append the value
            append(value)
            return
        }
        
        let newNode = Node(value: value) // Create a new node with the given value
        if index == 0 { // If inserting at the beginning of the list
            prepend(value)
            return
        }
        
        let leader = traverseToIndex(index - 1) // Get the node before the insertion point
        let follower = leader?.next // Get the node currently at the insertion point
        leader?.next = newNode // Link the leader's next reference to the new node
        newNode.previous = leader // Link the new node's previous reference to the leader
        newNode.next = follower // Link the new node's next reference to the follower
        follower?.previous = newNode // Link the follower's previous reference to the new node
        length += 1 // Increment the length of the linked list
    }
    
    func remove(_ index: Int) {
        guard index >= 0 && index < length else { return } // Allow index 0
        if index == 0 { // Removing the head
            head = head?.next
            head?.previous = nil
            if length == 1 { // If only one node was present
                tail = nil
            }
        } else {
            let leader = traverseToIndex(index - 1) // Node before the unwanted node
            let unwantedNode = leader?.next
            leader?.next = unwantedNode?.next
            if unwantedNode === tail { // If removing the tail
                tail = leader
            } else {
                unwantedNode?.next?.previous = leader // Update the next node's previous reference
            }
        }
        length -= 1
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
