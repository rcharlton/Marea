//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import Bricolage
import Foundation

public class MareaService {
    private enum Constant {
        /// https://api.marea.ooo/doc/
        static let serviceURL = URL(string: "https://api.marea.ooo")!
    }

    private let mareaClient: EndpointInvoking

    init(mareaClient: EndpointInvoking) {
        self.mareaClient = mareaClient
    }

    public convenience init(token: String) {
        let client = configure(WebClient(serviceURL: Constant.serviceURL)) {
            $0.additionalHeaders = ["x-marea-api-token": token]
        }
        self.init(mareaClient: client)
    }

    public var stations: [StationListing] {
        get async throws {
            try await mareaClient.invoke(endpoint: ListStations())
        }
    }

    public func station(for id: String) async throws -> Station {
        try await mareaClient.invoke(endpoint: GetStation(id: id))
    }

    public func tides(for stationId: String) async throws -> Tides {
        try await mareaClient.invoke(endpoint: GetTides(stationId: stationId))
    }
}
