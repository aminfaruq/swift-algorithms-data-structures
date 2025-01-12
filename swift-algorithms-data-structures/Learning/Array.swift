//
//  Array.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 02/01/25.
//

struct MyArray {
    
    private var data: [Int: Any] = [:]
    private(set) var length: Int = 0
    
    func get(index: Int) -> Any? {
        return data[index]
    }
    
    mutating func push(item: Any) -> Int {
        data[length] = item
        length += 1
        return length
    }
    
    mutating func pop() -> Any? {
        guard length > 0 else { return nil }
        let lastItem = data[length - 1]
        data[length - 1] = nil
        length -= 1
        return lastItem
    }
    
    mutating func delete(at index: Int) -> Any? {
        guard index >= 0 && index < length else { return nil }
        let item = data[index]
        shiftItems(from: index)
        return item
    }
    
    private mutating func shiftItems(from index: Int) {
        for i in index..<length - 1 {
            data[i] = data[i + 1]
        }
        data[length - 1] = nil
        length -= 1
    }
}
