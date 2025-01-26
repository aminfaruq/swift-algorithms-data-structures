//
//  MergeSort.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 26/01/25.
//

// Merge sort function
func mergeSort(_ array: [Int]) -> [Int] {
    // Base case: if the array has only one element, return it
    if array.count == 1 {
        return array
    }
    
    // split the array into left and right halves
    let middle = array.count / 2
    let left = Array(array[0..<middle]) // left half
    let right = Array(array[middle...]) // right half
    
    // recursively merge sort the left and right halves, then merge them
    return merge(mergeSort(left), mergeSort(right))
}

// merge function to combine two sorted arrays
private func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var result: [Int] = [] // Result array to store merged element
    var leftIndex = 0 // pointer for the left array
    var rightIndex = 0 // pointer for the right array
    
    // compare elements form left and right arrays and append the smaller one
    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            result.append(left[leftIndex]) // Add from left array
            leftIndex += 1 // Move left pointer forward
        } else {
            result.append(right[rightIndex]) // Add from right array
            rightIndex += 1 // Move right pointer forward
        }
    }
    
    // Add remaining elements from the left and right arrays
    result.append(contentsOf: left[leftIndex...]) // append remaining left elements
    result.append(contentsOf: right[rightIndex...]) // append remaining right elements
    
    return result
}
