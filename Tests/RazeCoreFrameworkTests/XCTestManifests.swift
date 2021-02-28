import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(RazeCoreFrameworkColorTests.allTests),
        testCase(RazeCoreFrameworkNetworkingTests.allTests)
    ]
}
#endif
