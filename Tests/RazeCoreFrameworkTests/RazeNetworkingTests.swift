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
    
    func post(with request: URLRequest, completionHandler: @escaping(Data?, Error?) -> Void){
        completionHandler(data, error)
    }
}

struct MockData: Codable, Equatable {
    var id: Int
    var name: String
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

    func testSendDataCell(){
        let session = NetworkingSessionMock()
        let manager = RazeCoreFramework.Networking.Manager()
        let sampleObject = MockData(id:1, name: "Burak")
        let data = try? JSONEncoder().encode(sampleObject)
        session.data = data
        manager.session = session
        let url = URL(fileURLWithPath: "url")
        let expectation = XCTestExpectation(description: "Sent Data")
        manager.sendData(to:url, body:sampleObject){ result in
            expectation.fulfill()
            switch result {
                case .success(let returnedData):
                    let returnedObject = try? JSONDecoder().decode(MockData.self, from: returnedData)
                    XCTAssertEqual(returnedObject, sampleObject)
                case .failure(let error):
                    XCTFail(error?.localizedDescription ?? "error forming error result")
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    static var allTests = [
        ("testLoadDataCell", testLoadDataCell),
        ("testSendDataCell", testSendDataCell)
    ]
    
}
