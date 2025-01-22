//
//  SelectionSort.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 22/01/25.
//

func selectionSort<T: Comparable>(_ array: inout [T]) {
    let count = array.count
    
    for i in 0..<count - 1 {
        // set current index as minimum
        var minIndex = i
        
        for j in (i + 1)..<count {
            if array[j] < array[minIndex] {
                // Update minimum if current id lower than what we had previously
                minIndex = j
            }
        }
        
        // Swap the elements
        if minIndex != i {
            let temp = array[i]
            array[i] = array[minIndex]
            array[minIndex] = temp
        }
    }
 }
