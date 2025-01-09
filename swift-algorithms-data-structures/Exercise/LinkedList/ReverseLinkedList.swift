//
//  ReverseLinkedList.swift
//  swift-algorithms-data-structures
//
//  Created by Phincon on 09/01/25.
//

import Foundation

extension LinkedList {
    
    func reverse() {
        // Ensure the list is not empty and has at least two nodes to reverse.
        guard let head = head, head.next != nil else { return }
        
        // Start with the first node (current head) and set it as `first`.
        var first = head
        // Update the tail of the list to be the current head, as it will become the last node after reversing.
        tail = head
        // Initialize `second` to point to the node next to `first`.
        var second = first.next
        
        // Iterate through the list until all nodes are reversed.
        while second != nil {
            // Temporarily store the next node in the sequence.
            let temp = second?.next
            // Reverse the pointer of the `second` node to point back to `first`.
            second?.next = first
            // Move `first` forward to the current `second` node.
            first = second!
            // Move `second` forward to the next node in the sequence (stored in `temp`).
            second = temp
        }
        
        // Ensure the new tail (original head) points to `nil`, indicating the end of the list.
        self.head?.next = nil
        // Update the head of the list to be the last node processed (`first`).
        self.head = first
    }
    
}
