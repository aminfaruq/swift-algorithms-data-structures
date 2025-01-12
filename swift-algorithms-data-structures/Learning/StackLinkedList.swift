//
//  StackLinkedList.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 11/01/25.
//

class StackLinkedList<T> {
    private class Node {
        var value: T
        var next: Node?
        
        init(value: T) {
            self.value = value
        }
    }
    
    private var top: Node?
    private var bottom: Node?
    private var length: Int = 0
    
    var isEmpty: Bool {
        return length == 0
    }
    
    var size: Int {
        return length
    }
    
    func peek() -> T? {
        return top?.value
    }
    
    func push(_ value: T) {
        let newNode = Node(value: value)
        if length == 0 {
            top = newNode
            bottom = newNode
        } else {
            let holdingPointer = top
            top = newNode
            top?.next = holdingPointer
        }
        
        length += 1
    }
    
    @discardableResult
    func pop() -> T? {
        guard let topNode = top else { return nil }
        
        if top === bottom {
            bottom = nil
        }
        
        top = topNode.next
        length -= 1
        return topNode.value
    }
    
}

//MARK: Helpers
extension StackLinkedList {
    func printList() -> [T] {
        var array: [T] = []
        var current = top
        while let node = current {
            array.append(node.value)
            current = node.next
        }
        
        return array
    }
    
    func showNodes() -> String {
        var currentNode = top
        var result: [String] = [] // Array to collect node information as strings
        
        while let node = currentNode {
            let prevValue = node.next?.value != nil ? "\(node.next!.value)" : "nil"
            result.append("[Value: \(node.value), Prev: \(prevValue)]") // Append node details
            currentNode = node.next // Move to the next node
        }
        
        return result.joined(separator: " -> ") // Join all nodes with " -> "
    }
}
