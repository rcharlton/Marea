//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import Bricolage
import Foundation

public func makeMareaClient(token: String) -> MareaClient {
    MareaWebClient(token: token)
}

// MARK: -

public protocol MareaClient {
    var stations: [StationListing] { get async throws }

    func station(for id: String) async throws -> Station

    func tides(
        duration: UInt,
        timestamp: UInt?,
        radius: UInt?,
        interval: UInt,
        latitude: Double,
        longitude: Double,
        model: Model,
        datum: Datum
    ) async throws -> Tides

    func tides(
        duration: UInt,
        timestamp: UInt?,
        interval: UInt,
        model: Model,
        stationRadius: UInt?,
        stationId: String,
        datum: Datum
    ) async throws -> Tides
}

// MARK: -

public extension MareaClient {
    func tides(
        duration: UInt = 1440,
        timestamp: UInt? = nil,
        radius: UInt? = nil,
        interval: UInt = 3600,
        latitude: Double,
        longitude: Double,
        datum: Datum = .msl
    ) async throws -> Tides {
        try await tides(
            duration: duration,
            timestamp: timestamp,
            radius: radius,
            interval: interval,
            latitude: latitude,
            longitude: longitude,
            model: .fes2014,
            datum: datum
        )
    }

    func tides(
        duration: UInt = 1440,
        timestamp: UInt? = nil,
        interval: UInt = 3600,
        stationRadius: UInt? = nil,
        stationId: String,
        datum: Datum = .msl
    ) async throws -> Tides {
        try await tides(
            duration: duration,
            timestamp: timestamp,
            interval: interval,
            model: .fes2014,
            stationRadius: stationRadius,
            stationId: stationId,
            datum: datum
        )
    }
}

// MARK: -

public enum Model {
    case fes2014, eot20
}

public typealias Datum = GetTides.Datum
