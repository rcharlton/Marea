//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import Bricolage
import XCTest
@testable import Marea

final class GetStationTests: XCTestCase {
    var endpoint: GetStation {
        GetStation(id: "ID")
    }

    var successJSONData: Data {
        get throws {
            try Bundle.module.jsonData(forResource: "v2-stations-id")
        }
    }

    var failureJSONData: Data {
        get throws {
            try Bundle.module.jsonData(forResource: "v2-error")
        }
    }

    func testURLRequest_Endpoint_RequestIsCorrect() {
        let request = endpoint.urlRequest(relativeTo: Constant.baseURL)

        XCTAssertNotNil(request)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(request?.url?.path, "/v2/stations/ID")
    }

    func testDecodeSuccess_Endpoint_SuccessIsCorrect() throws {
        let success = try endpoint.decodeSuccess(from: try successJSONData)

        XCTAssertEqual(
            success,
            Station(
                status: 200,
                id: "ID",
                name: "NAME",
                latitude: 1,
                longitude: 2,
                provider: "PROVIDER",
                type: .reference,
                datums: Datums(
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
                timezone: "TIMEZONE"
            )
        )
    }

    func testDecodeFailure_Endpoint_FailureIsCorrect() throws {
        let failure = try endpoint.decodeFailure(from: try failureJSONData)

        XCTAssertEqual(failure, Error(message: "ERROR_MESSAGE", statusCode: 123))
    }
}
