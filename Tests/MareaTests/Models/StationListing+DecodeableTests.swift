//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import XCTest
@testable import Marea

final class StationListing_DecodeableTests: XCTestCase {
    func testDecode_JSON_StationListingsAreCorrect() throws {
        let data = try Bundle.module.jsonData(forResource: "station-listing", subdirectory: "Data")
        XCTAssertNotNil(data)

        let decoder = makeJSONDecoder()
        let stationListing = try data.flatMap { try decoder.decode(StationListing.self, from: $0) }

        XCTAssertEqual(
            stationListing,
            StationListing(id: "id1", name: "name1", country: "country1", latitude: 1, longitude: 2)
        )
    }
}
