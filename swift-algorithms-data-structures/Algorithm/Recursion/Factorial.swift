//
//  Factorial.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 19/01/25.
//

func findFactorialRecursive(_ number: Int) -> Int {
    var mutableNum = number
    mutableNum -= 1
    var factorial = number * mutableNum
    if mutableNum >= 1 {
        return number * findFactorialRecursive(mutableNum)
    }
    return 1
}

func findFactorialIterative(_ number: Int) -> Int {
    var output = 1
    if (number > 1) {
        for j in 1...number{
            output *= j
        }
    }
    return output
}
