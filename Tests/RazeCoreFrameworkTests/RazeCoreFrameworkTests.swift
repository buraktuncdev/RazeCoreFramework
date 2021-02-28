import XCTest
@testable import RazeCoreFramework

final class RazeColorTests: XCTestCase {
    func testColorRedEqual(){
        let color = RazeCoreFramework.Color.fromHexString("FF0000")
            XCTAssertEqual(color, .red)
        }
    
    
    func testRazeColorsAreEqual(){
        let color = RazeCoreFramework.Color.fromHexString("006736")
        XCTAssertEqual(color, RazeCoreFramework.Color.razeColor)
    }
    
    func testSecondaryRazeColorsAreEqual(){
        let color = RazeCoreFramework.Color.fromHexString("FCFFFD")
        XCTAssertEqual(color, RazeCoreFramework.Color.secondaryRazeColor)
    }
        
        static var allTests = [
            ("testColorRedEqual", testColorRedEqual),
            ("testColorRedEqual", testRazeColorsAreEqual),
            ("testColorRedEqual", testSecondaryRazeColorsAreEqual),
        ]
}
