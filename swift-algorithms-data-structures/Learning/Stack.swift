//
//  Stack.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 14/12/24.
//

import Foundation

struct Stack<Element: Equatable> : Equatable {
    // Storage
    private var storage: [Element] = []
    
    // Empty
    var isEmpty: Bool {
        return peek() == nil
    }
    
    init() {}
    
    init(_ elements: [Element]) {
        storage = elements
    }
    
    // Peek
    func peek() -> Element? {
        return storage.last
    }
    
    // Push
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    // Pop
    @discardableResult
    mutating func pop() -> Element? {
        return storage.popLast()
    }
    
}

extension Stack: CustomStringConvertible {
    var description: String {
        return storage
            .map { "\($0)" }
            .joined(separator: " ")
    }
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        storage = elements
    }
}
