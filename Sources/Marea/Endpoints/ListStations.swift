//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import Bricolage
import Foundation

struct ListStations: Endpoint {
    typealias Success = [StationListing]
    typealias Failure = Error

    let successStatusCodes = [200]

    var decoder: Decoding { makeJSONDecoder() }

    func urlRequest(relativeTo url: URL) -> URLRequest? {
        URL(string: "/v2/stations", relativeTo: url)
            .map { URLRequest(url: $0) }
    }
}
