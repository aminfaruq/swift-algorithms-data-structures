//
//  LinkedList.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 19/12/24.
//

import Foundation

class LinkedList {
    var head: Node?
    
    init(head: Node?) {
        self.head = head
    }
    
    func append(_ node: Node) {
        guard head != nil else {
            head = node
            return
        }
        
        var current = head
        while let _ = current?.next {
            current = current?.next
        }
        
        current?.next = node
    }
    
    // Get a node from a particular position.
    // Assume the first position is "1".
    // Return "nil" if position is not in the list.
    func getNode(atPosition position: Int) -> Node? {
        // position less than 1 not valid
        guard position >= 1 else { return nil }
        
        var current = head
        var currentPosition = 1
        
        while let currentNode = current {
            if currentPosition == position {
                return currentNode
            }
            current = currentNode.next
            currentPosition += 1
        }
        
        return nil
    }
    
    // Insert a new node at the given position.
    // Assume the first position is "1".
    // Inserting at position 3 means between
    // the 2nd and 3rd nodes.
    func insertNode(_ node: Node, at position: Int) {
        // position less than 1 not valid
        guard position >= 1 else { return }
        
        // if want to insert on position 1
        if position == 1 {
            node.next = head
            head = node
            return
        }
        
        var current = head
        var currentPosition = 1
        
        // Navigate position before the target positon
        while let currentNode = current, currentPosition < position - 1 {
            current = currentNode.next
            currentPosition += 1
        }
        
        // if position greather than long list
        guard let previousNode = current else { return }
        
        // insert node
        node.next = previousNode.next
        previousNode.next = node
    }
    
    // Delete the first node with a given value.
    func deleteNode(withValue value: Int) {
        // if linked list is empty
        guard head != nil else { return }
        
        // if first node have match value
        if head?.value == value {
            head = head?.next
            return
        }
        
        var current = head
        var previous: Node?
        
        // navigate from linked list for get match node
        while let currentNode = current {
            if currentNode.value == value {
                previous?.next = currentNode.next
                return
            }
            previous = current
            current = currentNode.next
        }
        
        //-> if not have matching value, there no delete action
    }
}
