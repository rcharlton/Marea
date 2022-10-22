//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import Bricolage
import Foundation

struct GetStation: Endpoint {
    typealias Success = Station
    typealias Failure = Error

    let successStatusCodes = [200]

    var decoder: Decoding { makeJSONDecoder() }

    let id: String

    func urlRequest(relativeTo url: URL) -> URLRequest? {
        URL(string: "/v2/stations/\(id)", relativeTo: url)
            .map { URLRequest(url: $0) }
    }
}
