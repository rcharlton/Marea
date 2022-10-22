//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import Bricolage
import Foundation

public struct GetStation: Endpoint {
    public typealias Success = Station
    public typealias Failure = Error

    let successStatusCodes = [200]

    public var decoder: Decoding { makeJSONDecoder() }

    let id: String

    public func urlRequest(relativeTo url: URL) -> URLRequest? {
        URL(string: "/v2/stations/\(id)", relativeTo: url)
            .map { URLRequest(url: $0) }
    }
}

public typealias StationError = EndpointError<Marea.GetStation>
