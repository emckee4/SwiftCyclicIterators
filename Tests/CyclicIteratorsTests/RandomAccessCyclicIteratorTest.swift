import XCTest
@testable import CyclicIterators

final class RandomAccessCyclicIteratorTest: XCTestCase {

    func testRA_basic() {
        var iter = [1,2,3].cyclicIterator()
        var result:[Int] = []
        for _ in 0..<6 {
            guard let val = iter.next() else {
                XCTFail("unexpected termination of iterator sequence")
                return
            }
            result.append(val)
        }
        XCTAssert(result == [1,2,3,1,2,3], "\(result)")
    }

    func testRA_longStride() {
        var iter = [1,2,3].cyclicIterator(stride:5)
        var result:[Int] = []
        for _ in 0..<6 {
            guard let val = iter.next() else {
                XCTFail("unexpected termination of iterator sequence")
                return
            }
            result.append(val)
        }
        XCTAssert(result == [1,3,2,1,3,2], "\(result)")
    }
    
    func testRA_offsetStart() {
        var iter = [1,2,3].cyclicIterator(startOffset: 5)
        var result:[Int] = []
        for _ in 0..<6 {
            guard let val = iter.next() else {
                XCTFail("unexpected termination of iterator sequence")
                return
            }
            result.append(val)
        }
        XCTAssert(result == [3,1,2,3,1,2], "\(result)")
    }
    
    func testRA_empty() {
        var iter = (0..<0).cyclicIterator()
        XCTAssert(iter.next() == nil)
    }
    
    func testRA_negativeStride() {
        var iter = (1...3).cyclicIterator(stride:-1)
        var result:[Int] = []
        for _ in 0..<6 {
            guard let val = iter.next() else {
                XCTFail("unexpected termination of iterator sequence")
                return
            }
            result.append(val)
        }
        XCTAssert(result == [3,2,1,3,2,1], "\(result)")
    }
    
    static var allTests = [
        ("testRA_basic", testRA_basic),
        ("testRA_longStride", testRA_longStride),
        ("testRA_offsetStart", testRA_offsetStart),
        ("testRA_empty", testRA_empty),
        ("testRA_negativeStride", testRA_negativeStride)
    ]
}


