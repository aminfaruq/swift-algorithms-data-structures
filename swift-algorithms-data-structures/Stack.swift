//
//  Stack.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 14/12/24.
//

import Foundation

struct Stack<Element> {
    // Storage
    private var storage: [Element] = []
    
    // Push
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    // Pop
    
}

extension Stack: CustomStringConvertible {
    var description: String {
        return storage
            .map { "\($0)" }
            .joined(separator: " ")
    }
}
