//
//  ReverseStringTest.swift
//  swift-algorithms-data-structuresTests
//
//  Created by Amin faruq on 02/01/25.
//

import XCTest
@testable import swift_algorithms_data_structures

final class ReverseStringTest: XCTestCase {

    func test_reverseString() {
        
        let sut = reverseString("Hi My name is Amin")
        
        XCTAssertEqual(sut, "nimA si eman yM iH")
    }
}
