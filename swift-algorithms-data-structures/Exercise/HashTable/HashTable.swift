//
//  HashTable.swift
//  swift-algorithms-data-structures
//
//  Created by Amin faruq on 03/01/25.
//


class HashTable {
    private var data: [[(key: String, value: Int)]]
    
    init(size: Int) {
        self.data = Array(repeating: [], count: size)
    }
    
    private func hash(_ key: String) -> Int {
        var hash = 0
        for (i, char) in key.enumerated() {
            hash = (hash + Int(char.asciiValue ?? 0) * i) % data.count
        }
        return hash
    }
    
    func set(_ key: String, _ value: Int) {
        let index = hash(key)
        // Check if the key already exist to update the value
        if let existingIndex = data[index].firstIndex(where: { $0.key == key }) {
            data[index][existingIndex].value = value
        } else {
            data[index].append((key: key, value: value))
        }
    }
    
    func get(_ key: String) -> Int? {
        let index = hash(key)
        return data[index].first(where: { $0.key == key } )?.value
    }
    
    //O(n^2)
    /*
     func keys() -> [String] {
        var keysArray: [String] = []
        for index in data.indices {
            if !data[index].isEmpty {
                for pair in data[index] {
                    keysArray.append(pair.key)
                }
            }
        }
        
        return keysArray
    }
     */
    
    //O(n)
    func keys() -> [String] {
        return data.flatMap { $0.map { $0.key } }
    }
    
    /* Extra: keys() Without Collision
     func keys() -> [String]? {
         // Return nil if data is empty
         if data.isEmpty {
             return nil
         }
         
         var result: [String] = []
         
         // Iterate over all buckets
         for bucket in data {
             // If the bucket is not empty
             if !bucket.isEmpty {
                 // Append all keys in the bucket
                 for pair in bucket {
                     result.append(pair.key)
                 }
             }
         }
         
         return result
     }
     */

}
