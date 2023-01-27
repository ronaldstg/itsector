//
//  itsectorTests.swift
//  itsectorTests
//
//  Created by Ronald de Souza on 27/01/23.
//

import XCTest
@testable import itsector

final class itsectorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHTTPClient_WhenGivenSuccessResponse_ReturnsSuccess() {
            // Given
            let query = "ios"
            let client = HTTPClient()
            
            // When
            let promise = expectation(description: "Books are retrieved")
            client.getBooks(query: query, completion: { (result) in
                switch result {
                case .success(let books):
                    // Then
                    XCTAssertNotNil(books)
                    promise.fulfill()
                case .failure(let error):
                    XCTFail("Error: \(error)")
                }
            })
            wait(for: [promise], timeout: 5)
        }
}
