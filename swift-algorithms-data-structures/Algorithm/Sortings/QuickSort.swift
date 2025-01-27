//
//  QuickSort.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 27/01/25.
//

// Main QuickSort function
@discardableResult
func quickSort(_ array: inout [Int], _ left: Int, _ right: Int) -> [Int] {
    //let length = array.count
    var pivot: Int
    var partitionIndex: Int
    
    // proceed only if there are elements to sort
    if left < right {
        pivot = right // set the pivot at the right index
        partitionIndex = partition(&array, pivot, left, right)
        
        // recursively sort the left and right parts of the array
        quickSort(&array, left, partitionIndex - 1)
        quickSort(&array, partitionIndex + 1, right)
        
    }
    return array
}

// Function to partition the array based on the pivot
private func partition(_ array: inout [Int], _ pivot: Int, _ left: Int, _ right: Int) -> Int {
    let pivotValue = array[pivot] // Pivot value
    var partitionIndex = left
    
    // iterate through elements between `left and `right`
    for i in left..<right {
        if array[i] < pivotValue { // If the element is smaller than pivot
            swap(&array, i, partitionIndex) // Swap the element into the left partition
            partitionIndex += 1 // Move the partition index to the right
        }
    }
    
    // Swap the pivot element into the partition position
    swap(&array, right, partitionIndex)
    
    return partitionIndex
}

// Function to swap two elements in the array
private func swap(_ array: inout [Int], _ firstIndex: Int, _ secondIndex: Int) {
    let temp = array[firstIndex]
    array[firstIndex] = array[secondIndex]
    array[secondIndex] = temp
}
