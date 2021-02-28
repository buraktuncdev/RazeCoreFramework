//
//  RazeNetworkingTests.swift
//  RazeCoreFrameworkTests
//
//  Created by Burak Tunc on 28.02.21.
//

import XCTest
@testable import RazeCoreFramework

class NetworkingSessionMock: NetworkSession {
    var data: Data?
    var error: Error?
    
    func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
        completionHandler(data, error)
    }
}

final class RazeNetworkingTests: XCTestCase {
    
    func testLoadDataCell(){
        let manager = RazeCoreFramework.Networking.Manager()
        let session = NetworkingSessionMock()
        manager.session = session // MARK: MOCK SESSION WITH PROPERTY INJECTION
        let expectation = XCTestExpectation(description: "Called For Data")
        let data = Data([0,1,0,1])
        session.data = data
        let url = URL(fileURLWithPath: "url")
        manager.loadData(from:url){ result in
            expectation.fulfill()
            switch result {
                case .success(let returnedData):
                    XCTAssertEqual(data, returnedData, "manager returned unexpected data")
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
