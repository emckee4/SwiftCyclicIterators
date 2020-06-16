import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BidirectionCyclicIteratorTest.allTests),
        testCase(BidirectionFiniteTest.allTests),
        testCase(RandomAccessCyclicIteratorTest.allTests),
        testCase(RandomAccessFiniteTest.allTests),
        testCase(BenchmarkTest.allTests),
    ]
}
#endif
