//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import XCTest
@testable import Marea

final class ListStationsTests: XCTestCase {
    var endpoint: ListStations {
        ListStations()
    }

    var successJSONData: Data {
        get throws {
            try Bundle.module.jsonData(forResource: "v2-stations")
        }
    }

    func testURLRequest_Endpoint_RequestIsCorrect() {
        let request = endpoint.urlRequest(relativeTo: Constant.baseURL)

        XCTAssertNotNil(request)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(request?.url?.path, "/v2/stations")
    }

    func testDecodeSuccess_Endpoint_SuccessIsCorrect() throws {
        let success = try endpoint.decodeSuccess(from: try successJSONData)

        XCTAssertEqual(
            success,
            [
                StationListing(id: "id1", name: "name1", country: "country1", latitude: 1, longitude: 2),
                StationListing(id: "id2", name: "name2", country: "country2", latitude: 3, longitude: 4),
                StationListing(id: "id3", name: "name3", country: "country3", latitude: 5, longitude: 6)
            ]
        )
    }
}
