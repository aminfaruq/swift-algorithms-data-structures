//
//  Fibonacci.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 19/01/25.
//

func fibonacciRecursive(_ num: Int) -> Int {
    guard num != 0, num != 1 else { return num }
    
    return fibonacciRecursive(num - 1) + fibonacciRecursive(num - 2)
}

func fibonacciIterative(_ n: Int) -> Int {
    var num1 = 0
    var num2 = 1
    
    for _ in 2...n {
        let num = num1 + num2
        num1 = num2
        num2 = num
    }
    
    return num2
}
