//
//  ListStationsTests.swift
//  
//
//  Created by Robin Charlton on 02/11/2022.
//

import XCTest
@testable import Marea

final class ListStationsTests: XCTestCase {
    func testURLRequest_ListStations_RequestIsCorrect() throws {
        let endpoint = ListStations()

        let request = endpoint.urlRequest(relativeTo: Constant.baseURL)

        XCTAssertNotNil(request)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(request?.url?.path, "/v2/stations")
    }
}
