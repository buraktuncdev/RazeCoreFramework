import XCTest
@testable import RazeCoreFramework

final class RazeCoreFrameworkTests: XCTestCase {
    func testColorRedEqual(){
            let color = RazeCoreFramework.colorFromHexString("FF0000")
            XCTAssertEqual(color, .red)
        }
        
        static var allTests = [
            ("testColorRedEqual", testColorRedEqual),
        ]
}
