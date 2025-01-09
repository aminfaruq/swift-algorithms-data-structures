//
//  ReverseLinkedListTest.swift
//  swift-algorithms-data-structuresTests
//
//  Created by Phincon on 09/01/25.
//

import XCTest
@testable import swift_algorithms_data_structures

final class ReverseLinkedListTest: XCTestCase {
    
    func test_reverse_inLinkedList() {
        let sut = LinkedList(1)
        
        sut.append(2)
        sut.append(3)
        sut.append(4)
        
        sut.reverse()
        
        XCTAssertEqual(sut.printList(), [4, 3, 2, 1])
    }

}
