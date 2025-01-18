//
//  ReverseString.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 02/01/25.
//

func reverseString(_ str: String) -> String {
    var text = str.toArray()
    text.reverse()
    return text.toString()
}

func reverseString(input: String) -> String {
    return input.split(separator: "").reversed().joined(separator: "")
}

extension String {
    func toArray() -> [Character] {
        Array(self)
    }
}

extension Array where Element == Character {
    func toString() -> String {
       return String(self)
    }
}
