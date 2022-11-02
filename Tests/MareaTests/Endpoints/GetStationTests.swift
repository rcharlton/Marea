//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import XCTest
@testable import Marea

final class GetStationTests: XCTestCase {
     func testURLRequest_Id_RequestIsCorrect() {
        let endpoint = GetStation(id: "ID")

        let request = endpoint.urlRequest(relativeTo: Constant.baseURL)

        XCTAssertNotNil(request)
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(request?.url?.path, "/v2/stations/ID")
    }
}
