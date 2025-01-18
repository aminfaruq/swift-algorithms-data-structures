//
//  BinarySearchTree.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 17/01/25.
//

class Node<T: Comparable> {
    var value: T
    var left: Node?
    var right: Node?
    
    init(value: T) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}

class BinarySearchTree<T: Comparable> {
    private(set) var root: Node<T>?
    
    init() {
        self.root = nil
    }
    
    func insert(_ value: T) {
        let newNode = Node(value: value)
        
        if root == nil {
            root = newNode
        } else {
            var currentNode = root
            while let node = currentNode {
                if value < node.value {
                    // Move to the left child
                    if node.left == nil {
                        node.left = newNode
                        return
                    }
                    currentNode = node.left
                } else {
                    // Move to the right child
                    if node.right == nil {
                        node.right = newNode
                        return
                    }
                    currentNode = node.right
                }
            }
        }
    }
    
    func lookup(_ value: T) -> Node<T>? {
        guard let root = root else {
            return nil // if tree is empty, return nil
        }
        
        var currentNode: Node<T>? = root
        while let node = currentNode {
            if value < node.value {
                currentNode = node.left // Move to left child
            } else if value > node.value {
                currentNode = node.right // Move to right child
            } else {
                return node // If Found, return node
            }
        }
        
        return nil
    }
    
    func remove(_ value: T) -> Bool {
        guard let root = root else {
            return false // If the tree is empty, nothing to remove
        }
        
        var currentNode: Node<T>? = root
        var parentNode: Node<T>? = nil
        
        while let node = currentNode {
            if value < node.value {
                parentNode = currentNode
                currentNode = node.left
            } else if value > node.value {
                parentNode = currentNode
                currentNode = node.right
            } else {
                // Node to be removed is found, now handle the removal
                
                // Case 1: No right child
                if node.right == nil {
                    if parentNode == nil {
                        self.root = node.left // If root is to be removed, just move the left child up
                    } else {
                        // If parent value > current value, set left child as parent's left child
                        if node.value < parentNode!.value {
                            parentNode?.left = node.left
                        } else {
                            parentNode?.right = node.left
                        }
                    }
                    // Case 2: Right child exists but no left child
                } else if node.right?.left == nil {
                    node.right?.left = node.left
                    if parentNode == nil {
                        self.root = node.right // If root is to be removed, move the right child up
                    } else {
                        // If parent value > current value, set right child as parent's left child
                        if node.value < parentNode!.value {
                            parentNode?.left = node.right
                        } else {
                            parentNode?.right = node.right
                        }
                    }
                    // Case 3: Right child has a left child
                } else {
                    // Find the leftmost child of the right subtree
                    var leftmost = node.right?.left
                    var leftmostParent = node.right
                    while leftmost?.left != nil {
                        leftmostParent = leftmost
                        leftmost = leftmost?.left
                    }
                    
                    // Parent's left subtree is now the leftmost's right subtree
                    leftmostParent?.left = leftmost?.right
                    leftmost?.left = node.left
                    leftmost?.right = node.right
                    
                    if parentNode == nil {
                        self.root = leftmost // If root is to be removed, set leftmost as new root
                    } else {
                        if node.value < parentNode!.value {
                            parentNode?.left = leftmost
                        } else {
                            parentNode?.right = leftmost
                        }
                    }
                }
                return true // Node removed successfully
            }
        }
        
        return false // Value not found, nothing to remove
    }
    
}
