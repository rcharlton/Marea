//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import XCTest
@testable import Marea

final class GetTidesTests: XCTestCase {
    func testURLRequest_ListStations_RequestIsCorrect() throws {
        let endpoint = GetTides(
            duration: 123,
            timestamp: 234,
            radius: 345,
            interval: 456,
            latitude: 567,
            longitude: 678,
            model: "MODEL",
            stationRadius: 789,
            stationId: "ID",
            datum: .hat
        )

        let request = endpoint.urlRequest(relativeTo: Constant.baseURL)

        XCTAssertNotNil(request)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(request?.url?.path, "/v2/tides")

        let query = request?.url?.query ?? ""
        XCTAssert(query.contains("duration=123"))
        XCTAssert(query.contains("timestamp=234"))
        XCTAssert(query.contains("radius=345"))
        XCTAssert(query.contains("interval=456"))
        XCTAssert(query.contains("latitude=567"))
        XCTAssert(query.contains("longitude=678"))
        XCTAssert(query.contains("model=MODEL"))
        XCTAssert(query.contains("station_radius=789"))
        XCTAssert(query.contains("station_id=ID"))
        XCTAssert(query.contains("radius=345"))
        XCTAssert(query.contains("datum=HAT"))
    }
}
