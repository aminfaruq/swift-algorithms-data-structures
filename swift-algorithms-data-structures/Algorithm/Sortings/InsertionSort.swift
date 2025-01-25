//
//  InsertionSort.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 25/01/25.
//

// Define the insertion sort function
func insertionSort(_ array: inout [Int]) {
    let length = array.count // Store the length of the array
    
    for i in 0..<length { // Loop through each element of the array
        if array[i] < array[0] {
            // If the current element is smaller than the first element
            let element = array.remove(at: i) // Remove the element from its current position
            array.insert(element, at: 0) // Insert it at the beginning of the array
        } else if i > 1 { // Ensure there's a valid range for the inner loop
            // Otherwise, find the correct position for the current element
            for j in 1..<i { // Loop through the sorted part of the array
                if array[i] > array[j - 1] && array[i] < array[j] {
                    // If the current element is greater than the previous element and less than the current element
                    let element = array.remove(at: i) // Remove the element from its current position
                    array.insert(element, at: j) // Insert it into the correct position
                    break // Exit the loop once the element is placed
                }
            }
        }
    }
}
