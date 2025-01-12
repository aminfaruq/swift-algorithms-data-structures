//
//  QueueTest.swift
//  swift-algorithms-data-structuresTests
//
//  Created by Amin faruq on 12/01/25.
//

import XCTest
@testable import swift_algorithms_data_structures

final class QueueTest: XCTestCase {

    var queue: Queue<String>!
    
    // Called before each test to set up a new instance of the queue
    override func setUp() {
        super.setUp()
        queue = Queue<String>()
    }
    
    // Called after each test to clean up the queue instance
    override func tearDown() {
        queue = nil
        super.tearDown()
    }

    func test_queue_enqueue() {
        // Enqueue multiple elements
        queue.enqueue("Linkin Park")
        queue.enqueue("30 seconds to mars")
        queue.enqueue("Dead Sara")
        
        // Verify that the first element is correctly set and the queue is not empty
        XCTAssertEqual(queue.peek(), "Linkin Park", "The first element should be 'Linkin Park'")
        XCTAssertFalse(queue.isEmpty, "Queue should not be empty after enqueueing elements")
    }
    
    func test_queue_dequeue() {
        // Enqueue multiple elements
        queue.enqueue("Linkin Park")
        queue.enqueue("30 seconds to mars")
        queue.enqueue("Dead Sara")
        
        // Dequeue the first element
        let dequeued = queue.dequeue()
        XCTAssertEqual(dequeued, "Linkin Park", "Dequeued element should be 'Linkin Park'")
        
        // Verify that the next element is correctly updated
        XCTAssertEqual(queue.peek(), "30 seconds to mars", "The next element should now be '30 seconds to mars'")
        XCTAssertFalse(queue.isEmpty, "Queue should not be empty after one dequeue")
    }
    
    func test_dequeue_empty_queue() {
        // Attempt to dequeue from an empty queue
        let dequeued = queue.dequeue()
        XCTAssertNil(dequeued, "Dequeueing from an empty queue should return nil")
        XCTAssertTrue(queue.isEmpty, "Queue should remain empty after dequeueing from an empty queue")
    }
    
    func test_enqueue_and_dequeue_single_element() {
        // Enqueue a single element
        queue.enqueue("Muse")
        XCTAssertEqual(queue.peek(), "Muse", "The only element should be 'Muse'")
        
        // Dequeue the only element
        let dequeued = queue.dequeue()
        XCTAssertEqual(dequeued, "Muse", "Dequeued element should be 'Muse'")
        XCTAssertTrue(queue.isEmpty, "Queue should be empty after dequeueing the only element")
    }
    
    func test_peek_empty_queue() {
        // Attempt to peek into an empty queue
        XCTAssertNil(queue.peek(), "Peeking into an empty queue should return nil")
    }
}
