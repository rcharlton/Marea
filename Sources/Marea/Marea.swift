//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import Bricolage
import Foundation

public class Marea {
    private enum Constant {
        /// https://api.marea.ooo/doc/
        static let serviceURL = URL(string: "https://api.marea.ooo")!
    }

    private let webClient: EndpointInvoking

    init(webClient: EndpointInvoking) {
        self.webClient = webClient
    }

    public convenience init(token: String) {
        let webClient = configure(WebClient(serviceURL: Constant.serviceURL)) {
            $0.additionalHeaders = ["x-marea-api-token": token]
        }
        self.init(webClient: webClient)
    }

    public var stations: [StationListing] {
        get async throws {
            try await webClient.invoke(endpoint: ListStations())
        }
    }

    public func station(for id: String) async throws -> Station {
        try await webClient.invoke(endpoint: GetStation(id: id))
    }

    public func tides(
        duration: UInt? = nil,
        timestamp: UInt? = nil,
        radius: UInt? = nil,
        interval: UInt? = nil,
        latitude: Double? = nil,
        longitude: Double? = nil,
        model: String? = nil,
        datum: Datum? = nil
    ) async throws -> Tides {
        let endpoint = GetTides(
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
        return try await webClient.invoke(endpoint: endpoint)
    }

    public func tides(
        duration: UInt? = nil,
        timestamp: UInt? = nil,
        interval: UInt? = nil,
        model: String? = nil,
        stationRadius: UInt? = nil,
        stationId: String? = nil,
        datum: Datum? = nil
    ) async throws -> Tides {
        let endpoint = GetTides(
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
        return try await webClient.invoke(endpoint: endpoint)
    }
}

public typealias Datum = GetTides.Datum
