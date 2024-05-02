//
//  UniversitySolutionTests.swift
//  UniversitySolutionTests
//
//  Created by ADEL ELGAZAR on 02/05/2024.
//

import XCTest
@testable import UniversitySolution

final class UniversitySolutionTests: XCTestCase {
    var interactor: UniversitySearchInteractor!

    override func setUp() {
        super.setUp()
        interactor = UniversitySearchInteractor()
    }

    override func tearDown() {
        interactor = nil
        super.tearDown()
    }

    func testFetchUniversitiesSuccess() {
        let expectation = self.expectation(description: "Fetch Universities")

        interactor.apiClient.fetchUniversities(country: "") { universities, error in
            if let error = error {
                XCTFail("Fetch universities failed with error: \(error)")
            } else if let universities = universities {
                XCTAssertFalse(universities.isEmpty, "Universities should not be empty")
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testFetchUniversitiesFailure() {
        let expectation = self.expectation(description: "Fetch Universities")
        
        interactor.apiClient.fetchUniversities(country: "") { universities, error in
            if let error = error {
                XCTAssertNotNil(error, "Error should not be nil")
                expectation.fulfill()
            } else if let universities = universities {
                XCTFail("Fetch universities should have failed")
            }
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
}
