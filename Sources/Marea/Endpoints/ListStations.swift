//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import Bricolage
import Foundation

public struct ListStations: Endpoint {
    public typealias Success = [StationListing]
    public typealias Failure = Error

    public let successStatusCodes = [200]

    public var decoder: Decoding { makeJSONDecoder() }

    public func urlRequest(relativeTo url: URL) -> URLRequest? {
        URL(string: "/v2/stations", relativeTo: url)
            .map { URLRequest(url: $0) }
    }
}

public typealias StationsError = EndpointError<ListStations>
