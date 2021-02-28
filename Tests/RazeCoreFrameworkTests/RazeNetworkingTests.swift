//
//  RazeNetworkingTests.swift
//  RazeCoreFrameworkTests
//
//  Created by Burak Tunc on 28.02.21.
//

import XCTest
@testable import RazeCoreFramework

final class RazeNetworkingTests: XCTestCase {
    
    func testLoadDataCell(){
        let manager = RazeCoreFramework.Networking.Manager()
        let expectation = XCTestExpectation(description: "Called For Data")
        guard let url = URL(string: "https://raywenderlich.com") else { return XCTFail("Could not create URL properly")}
        manager.loadData(from:url){ result in
            expectation.fulfill()
            switch result {
                case .success(let returnedData):
                    XCTAssertNotNil(returnedData, "Response Data is Nil")
                case .failure(let error):
                    XCTFail(error?.localizedDescription ?? "error forming error result")
            }
        }
        wait(for: [expectation], timeout: 5)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    static var allTests = [
        ("testExample", testExample),
        ("testLoadDataCell", testLoadDataCell)
    ]
    
}
