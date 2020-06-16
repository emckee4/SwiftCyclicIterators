import XCTest
@testable import CyclicIterators

final class BidirectionFiniteTest: XCTestCase {

    func testBDF_basic() {
        let bd = "abc".finiteCyclicIterator(limit:6)
        let expected = "abcabc"
        let resultReduce = bd.reduce("") { $0 + String($1)}
        XCTAssert(resultReduce == expected)
        let resultLazy = bd.lazy.reduce("") { $0 + String($1)}
        XCTAssert(resultLazy == expected)
        var resultLoop:String = ""
        for ch in bd {
            resultLoop += String(ch)
        }
        XCTAssert(resultLoop == expected)
    }

    func testBDF_longStride() {
        let bd = "abc".finiteCyclicIterator(limit:6, stride:5)
        let expected = "acbacb"
        let resultReduce = bd.reduce("") { $0 + String($1)}
        XCTAssert(resultReduce == expected)
        let resultLazy = bd.lazy.reduce("") { $0 + String($1)}
        XCTAssert(resultLazy == expected)
        var resultLoop:String = ""
        for ch in bd {
            resultLoop += String(ch)
        }
        XCTAssert(resultLoop == expected)
    }
    
    func testBDF_offsetStart() {
        let bd = "abc".finiteCyclicIterator(limit:6, startOffset: 5)
        let expected = "cabcab"
        let resultReduce = bd.reduce("") { $0 + String($1)}
        XCTAssert(resultReduce == expected)
        let resultLazy = bd.lazy.reduce("") { $0 + String($1)}
        XCTAssert(resultLazy == expected)
        var resultLoop:String = ""
        for ch in bd {
            resultLoop += String(ch)
        }
        XCTAssert(resultLoop == expected)
    }
    
    func testBDF_empty() {
        let bd = "".finiteCyclicIterator(limit:6)
        let expected = ""
        let resultReduce = bd.reduce("") { $0 + String($1)}
        XCTAssert(resultReduce == expected)
        let resultLazy = bd.lazy.reduce("") { $0 + String($1)}
        XCTAssert(resultLazy == expected)
        var resultLoop:String = ""
        for ch in bd {
            resultLoop += String(ch)
        }
        XCTAssert(resultLoop == expected)
    }
    
    func testBDF_negativeStride() {
        let bd = "abc".finiteCyclicIterator(limit:6, stride:-1)
        let expected = "cbacba"
        let resultReduce = bd.reduce("") { $0 + String($1)}
        XCTAssert(resultReduce == expected)
        let resultLazy = bd.lazy.reduce("") { $0 + String($1)}
        XCTAssert(resultLazy == expected)
        var resultLoop:String = ""
        for ch in bd {
            resultLoop += String(ch)
        }
        XCTAssert(resultLoop == expected)
    }
    
    
    static var allTests = [
        ("testBDF_basic", testBDF_basic),
        ("testBDF_longStride", testBDF_longStride),
        ("testBDF_offsetStart", testBDF_offsetStart),
        ("testBDF_empty", testBDF_empty),
        ("testBDF_negativeStride", testBDF_negativeStride)
    ]
}
