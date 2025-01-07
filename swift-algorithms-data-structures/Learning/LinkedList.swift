//
//  LinkedList.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 19/12/24.
//

import Foundation

class LinkedList {
    var head: Node? // The first node in the linked list
    
    // Initialize the linked list with an optional head node
    init(head: Node?) {
        self.head = head
    }
    
    // Add a new node to the end of the linked list
    func append(_ node: Node) {
        // If the list is empty, set the new node as the head
        guard head != nil else {
            head = node
            return
        }
        
        // Start at the head and traverse to the last node
        var current = head
        while let _ = current?.next {
            current = current?.next
        }
        
        // Link the new node to the last node
        current?.next = node
    }
    
    // Get a node at a specific position (1-based index)
    func getNode(atPosition position: Int) -> Node? {
        // Position less than 1 is invalid
        guard position >= 1 else { return nil }
        
        var current = head // Start at the head of the list
        var currentPosition = 1 // Start counting from position 1
        
        // Traverse the list to find the node at the given position
        while let currentNode = current {
            if currentPosition == position {
                return currentNode // Return the node if the position matches
            }
            current = currentNode.next
            currentPosition += 1
        }
        
        // If the position is out of range, return nil
        return nil
    }
    
    // Insert a new node at a specific position (1-based index)
    func insertNode(_ node: Node, at position: Int) {
        // Position less than 1 is invalid
        guard position >= 1 else { return }
        
        // If inserting at the head (position 1)
        if position == 1 {
            node.next = head // Point the new node to the current head
            head = node // Update the head to the new node
            return
        }
        
        var current = head // Start at the head
        var currentPosition = 1 // Start counting from position 1
        
        // Traverse to the node just before the target position
        while let currentNode = current, currentPosition < position - 1 {
            current = currentNode.next
            currentPosition += 1
        }
        
        // If the position is greater than the list length, do nothing
        guard let previousNode = current else { return }
        
        // Insert the new node between previousNode and the next node
        node.next = previousNode.next
        previousNode.next = node
    }
    
    // Delete the first node with a specific value
    func deleteNode(withValue value: Int) {
        // If the list is empty, do nothing
        guard head != nil else { return }
        
        // If the head node matches the value, remove it
        if head?.value == value {
            head = head?.next // Update the head to the next node
            return
        }
        
        var current = head // Start at the head
        var previous: Node? // Keep track of the previous node
        
        // Traverse the list to find the node with the matching value
        while let currentNode = current {
            if currentNode.value == value {
                // Skip the matching node by linking the previous node to the next node
                previous?.next = currentNode.next
                return
            }
            previous = current // Move the previous pointer
            current = currentNode.next // Move to the next node
        }
        
        // If no node matches the value, do nothing
    }
    
    // Add a new node to the start of the linked list
    func prepend(_ node: Node) {
        node.next = head // Set the next pointer of the new node to the current head
        head = node // Update the head to the new node
    }
}
