//
//  bubbleSort.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 22/01/25.
//

func bubbleSort<T: Comparable>(_ array: inout [T]) {
    let count = array.count
    for _ in 0..<count {
        for j in 0..<count - 1 {
            if array[j] > array[j + 1] {
                // Swap the numbers
                let temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp
            }
        }
    }
}
