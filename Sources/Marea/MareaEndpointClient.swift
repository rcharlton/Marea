//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import Bricolage
import Foundation

class MareaEndpointClient {
    private let client: EndpointInvoking

    init(with client: EndpointInvoking) {
        self.client = client
    }
}

// MARK: -

extension MareaEndpointClient: MareaClient {
    var stations: [StationListing] {
        get async throws {
            try await client.invoke(endpoint: ListStations())
        }
    }

    func station(for id: String) async throws -> Station {
        try await client.invoke(endpoint: GetStation(id: id))
    }

    func tides(
        duration: UInt,
        timestamp: UInt?,
        radius: UInt?,
        interval: UInt,
        latitude: Double,
        longitude: Double,
        model: Model,
        datum: Datum
    ) async throws -> Tides {
        try await client.invoke(
            endpoint: GetTides(
                duration: duration,
                timestamp: timestamp,
                radius: radius,
                interval: interval,
                latitude: latitude,
                longitude: longitude,
                model: model,
                stationRadius: nil,
                stationId: nil,
                datum: datum
            )
        )
    }

    func tides(
        duration: UInt,
        timestamp: UInt?,
        interval: UInt,
        model: Model,
        stationRadius: UInt?,
        stationId: String,
        datum: Datum
    ) async throws -> Tides {
        try await client.invoke(
            endpoint: GetTides(
                duration: duration,
                timestamp: timestamp,
                radius: nil,
                interval: interval,
                latitude: nil,
                longitude: nil,
                model: model,
                stationRadius: stationRadius,
                stationId: stationId,
                datum: datum
            )
        )
    }
}
