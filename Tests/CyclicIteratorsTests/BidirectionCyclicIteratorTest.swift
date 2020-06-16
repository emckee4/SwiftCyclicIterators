import XCTest
@testable import CyclicIterators

final class BidirectionCyclicIteratorTest: XCTestCase {

    func testBD_basic() {
        var bd = "abc".cyclicIterator()
        var result:String = ""
        for _ in 0..<6 {
            guard let ch = bd.next() else {
                XCTFail("unexpected termination of iterator sequence")
                return
            }
            result += String(ch)
        }
        XCTAssert(result == "abcabc", "\(result)")
    }

    func testBD_longStride() {
        var bd = "abc".cyclicIterator(stride:5)
        var result:String = ""
        for _ in 0..<6 {
            guard let ch = bd.next() else {
                XCTFail("unexpected termination of iterator sequence")
                return
            }
            result += String(ch)
        }
        XCTAssert(result == "acbacb", "\(result)")
    }
    
    func testBD_offsetStart() {
        var bd = "abc".cyclicIterator(startOffset: 5)
        var result:String = ""
        for _ in 0..<6 {
            guard let ch = bd.next() else {
                XCTFail("unexpected termination of iterator sequence")
                return
            }
            result += String(ch)
        }
        XCTAssert(result == "cabcab", "\(result)")
    }
    
    func testBD_empty() {
        var bd = "".cyclicIterator()
        XCTAssert(bd.next() == nil)
    }
    
    func testBD_negativeStride() {
        var bd = "abc".cyclicIterator(stride:-1)
        var result:String = ""
        for _ in 0..<6 {
            guard let ch = bd.next() else {
                XCTFail("unexpected termination of iterator sequence")
                return
            }
            result += String(ch)
        }
        XCTAssert(result == "cbacba", "\(result)")
    }
    
    
    static var allTests = [
        ("testBD_basic", testBD_basic),
        ("testBD_longStride", testBD_longStride),
        ("testBD_offsetStart", testBD_offsetStart),
        ("testBD_empty", testBD_empty),
        ("testBD_negativeStride", testBD_negativeStride)
    ]
}
