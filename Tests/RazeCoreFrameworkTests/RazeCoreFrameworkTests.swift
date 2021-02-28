import XCTest
@testable import RazeCoreFramework

final class RazeCoreFrameworkTests: XCTestCase {
    func testColorRedEqual(){
            let color = RazeCoreFramework.colorFromHexString("FF0000")
            XCTAssertEqual(color, .red)
        }
    
    
    func testRazeColorsAreEqual(){
        let color = RazeCoreFramework.colorFromHexString("006736")
        XCTAssertEqual(color, RazeCoreFramework.razeColor)
    }
    
    func testSecondaryRazeColorsAreEqual(){
        let color = RazeCoreFramework.colorFromHexString("FCFFFD")
        XCTAssertEqual(color, RazeCoreFramework.secondaryRazeColor)
    }
        
        static var allTests = [
            ("testColorRedEqual", testColorRedEqual),
            ("testColorRedEqual", testRazeColorsAreEqual),
            ("testColorRedEqual", testSecondaryRazeColorsAreEqual),
        ]
}
