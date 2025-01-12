//
//  MergeSortedArrays.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 02/01/25.
//

func mergeSortedArray(first: [Int], last: [Int]) -> [Int] {
    let container = first + last
    return container.sorted()
}
