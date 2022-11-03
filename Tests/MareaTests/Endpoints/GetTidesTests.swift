//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import XCTest
@testable import Marea

final class GetTidesTests: XCTestCase {
    var endpoint: GetTides {
        GetTides(
            duration: 123,
            timestamp: 234,
            radius: 345,
            interval: 456,
            latitude: 567,
            longitude: 678,
            model: .eot20,
            stationRadius: 789,
            stationId: "ID",
            datum: .hat
        )
    }

    var successJSONData: Data {
        get throws {
            try Bundle.module.jsonData(forResource: "v2-tides-model")
        }
    }

    func testURLRequest_Endpoint_RequestIsCorrect() {
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
        XCTAssert(query.contains("model=EOT20"))
        XCTAssert(query.contains("station_radius=789"))
        XCTAssert(query.contains("station_id=ID"))
        XCTAssert(query.contains("radius=345"))
        XCTAssert(query.contains("datum=HAT"))
    }

    func testDecodeSuccess_Endpoint_SuccessIsCorrect() throws {
        let success = try endpoint.decodeSuccess(from: try successJSONData)

        XCTAssertEqual(
            success,
            Tides(
                disclaimer: "DISCLAIMER",
                status: 123,
                latitude: 1,
                longitude: 2,
                origin: .init(latitude: 3, longitude: 4, distance: 5, unit: "UNIT", station: nil),
                datums: .init(
                    dhq: 1,
                    dlq: 2,
                    dtl: 3,
                    gt: 4,
                    hat: 5,
                    lat: 6,
                    mhhw: 7,
                    mhw: 8,
                    mllw: 9,
                    mlw: 10,
                    mn: 11,
                    mtl: 12
                ),
                timestamp: 12345,
                datetime: Date(timeIntervalSince1970: 1666217234),
                unit: "UNIT",
                timezone: "TIMEZONE",
                datum: "DATUM",
                extremes: [
                    .init(timestamp: 1, datetime: Date(timeIntervalSince1970: 1633451650), height: 2, state: .highTide),
                    .init(timestamp: 3, datetime: Date(timeIntervalSince1970: 1633482505), height: 4, state: .lowTide)
                ],
                heights: [
                    .init(timestamp: 5, datetime: Date(timeIntervalSince1970: 1633451210), height: 6, state: .falling),
                    .init(timestamp: 7, datetime: Date(timeIntervalSince1970: 1633454810), height: 8, state: .rising),
                    .init(timestamp: 9, datetime: Date(timeIntervalSince1970: 1633458410), height: 10, state: .falling)
                ],
                source: .fes2014,
                copyright: "COPYRIGHT"
            )
        )
    }
}
