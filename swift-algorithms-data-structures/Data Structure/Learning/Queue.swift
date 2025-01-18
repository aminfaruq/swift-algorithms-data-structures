//
//  Queue.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 12/01/25.
//

class Queue<T> {
    class Node {
        var value: T // Value of the node
        var next: Node? // Reference to the next node
        
        init(value: T) {
            self.value = value
            self.next = nil
        }
    }
    
    private var first: Node?
    private var last: Node?
    private var length: Int = 0

    var isEmpty: Bool {
        return length == 0
    }
    
    func peek() -> T? {
        return first?.value
    }
    
    func enqueue(_ value: T) {
        let newNode = Node(value: value)
        if length == 0 {
            first = newNode
            last = newNode
        } else {
            last?.next = newNode
            last = newNode
        }
        
        length += 1
    }
    
    @discardableResult
    func dequeue() -> T? {
        guard let firstNode = first else { return nil }
        
        if first === last { // Jika hanya ada satu elemen
            last = nil
        }
        
        first = firstNode.next
        length -= 1
        return firstNode.value
    }

    
}

/*
 class Queue {
   constructor() {
     this.first = null;
     this.last = null;
     this.length = 0;
   }
   peek() {
     return this.first;
   }
   enqueue(value) {
     const newNode = new Node(value);
     if (this.length === 0) {
       this.first = newNode;
       this.last = newNode;
     } else {
       this.last.next = newNode;
       this.last = newNode;
     }
     this.length++;
     return this;
   }
   dequeue() {
     if (!this.first) {
       return null;
     }
     if (this.first === this.last) {
       this.last = null;
     }
     this.first = this.first.next;
     this.length--;
     return this;
   }
   //isEmpty;
 }
 */
