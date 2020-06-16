import XCTest
@testable import CyclicIterators

final class RandomAccessFiniteTest: XCTestCase {

    func testRAF_basic() {
        var iter = [1,2,3].finiteCyclicIterator(limit:6)
        let expected = [1,2,3,1,2,3]
        let resultReduce = iter.map{$0}
        XCTAssert(resultReduce == expected)
        let resultLazy:[Int] = iter.lazy.map{$0}
        XCTAssert(resultLazy == expected)
        var resultLoop:[Int] = []
        for val in iter {
            resultLoop.append(val)
        }
        XCTAssert(resultLoop == expected)
        XCTAssert(iter.next() == 1)
    }

    func testRAF_longStride() {
        var iter = [1,2,3].finiteCyclicIterator(limit:6, stride:5)
        let expected = [1,3,2,1,3,2]
        let resultReduce = iter.map{$0}
        XCTAssert(resultReduce == expected)
        let resultLazy:[Int] = iter.lazy.map{$0}
        XCTAssert(resultLazy == expected)
        var resultLoop:[Int] = []
        for val in iter {
            resultLoop.append(val)
        }
        XCTAssert(resultLoop == expected)
        XCTAssert(iter.next() == 1)
    }
    
    func testRAF_offsetStart() {
        var iter = [1,2,3].finiteCyclicIterator(limit:6, startOffset: 5)
        let expected = [3,1,2,3,1,2]
        let resultReduce = iter.map{$0}
        XCTAssert(resultReduce == expected)
        let resultLazy:[Int] = iter.lazy.map{$0}
        XCTAssert(resultLazy == expected)
        var resultLoop:[Int] = []
        for val in iter {
            resultLoop.append(val)
        }
        XCTAssert(resultLoop == expected)
        XCTAssert(iter.next() == 3)
    }
    
    func testRAF_empty() {
        var iter = (0..<0).finiteCyclicIterator(limit:6)
        let expected:[Int] = []
        let resultReduce = iter.map{$0}
        XCTAssert(resultReduce == expected)
        let resultLazy:[Int] = iter.lazy.map{$0}
        XCTAssert(resultLazy == expected)
        var resultLoop:[Int] = []
        for val in iter {
            resultLoop.append(val)
        }
        XCTAssert(resultLoop == expected)
        XCTAssert(iter.next() == nil)
    }
    
    func testRAF_negativeStride() {
        var iter = (1...3).finiteCyclicIterator(limit:6, stride:-1)
        let expected = [3,2,1,3,2,1]
        let resultReduce = iter.map{$0}
        XCTAssert(resultReduce == expected)
        let resultLazy:[Int] = iter.lazy.map{$0}
        XCTAssert(resultLazy == expected)
        var resultLoop:[Int] = []
        for val in iter {
            resultLoop.append(val)
        }
        XCTAssert(resultLoop == expected)
        XCTAssert(iter.next() == 3)
    }
    
    func testRAF_multi() {
        var iter = (1...3).finiteCyclicIterator(limit:6, stride:6, startOffset: 3)
        let expected = [1,1,1,1,1,1]
        let resultReduce = iter.map{$0}
        XCTAssert(resultReduce == expected)
        let resultLazy:[Int] = iter.lazy.map{$0}
        XCTAssert(resultLazy == expected)
        var resultLoop:[Int] = []
        for val in iter {
            resultLoop.append(val)
        }
        XCTAssert(resultLoop == expected)
        XCTAssert(iter.next() == 1)
    }
    
    static var allTests = [
        ("testRAF_basic", testRAF_basic),
        ("testRAF_longStride", testRAF_longStride),
        ("testRAF_offsetStart", testRAF_offsetStart),
        ("testRAF_empty", testRAF_empty),
        ("testRAF_negativeStride", testRAF_negativeStride)
    ]
}


