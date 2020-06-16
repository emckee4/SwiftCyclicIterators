import XCTest
@testable import CyclicIterators

final class BenchmarkTest: XCTestCase {
    let alpha = "Where does it come from? Contrary to popular belief, Lorem Ipsum is not simply random text. It has ro"
    let nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100]

    ///Short stride test to compare with long stride test
    func test_bdPerfShort() {
        var sum = 0
        var iter = alpha.cyclicIterator(stride: 1)
        measure {
            for _ in 0..<1000 {
                sum += Int(iter.next()!.asciiValue!)
            }
        }
    }
    
    func test_bdPerfLong() {
        var sum = 0
        var iter = alpha.cyclicIterator(stride: 57)
        measure {
            for _ in 0..<1000 {
                sum += Int(iter.next()!.asciiValue!)
            }
        }
    }

    func test_raPerfShort() {
        var sum = 0
        var iter = nums.cyclicIterator(stride: 1)
        measure {
            for _ in 0..<1000 {
                sum += iter.next()!
            }
        }
    }
    
    func test_raPerfLong() {
        var sum = 0
        var iter = nums.cyclicIterator(stride: 57)
        measure {
            for _ in 0..<1000 {
                sum += iter.next()!
            }
        }
    }
    
    static var allTests = [
        ("test_bdPerfShort", test_bdPerfShort),
        ("test_bdPerfLong", test_bdPerfLong),
        ("test_raPerfShort", test_raPerfShort),
        ("test_raPerfLong", test_raPerfLong),
    ]
    
}
