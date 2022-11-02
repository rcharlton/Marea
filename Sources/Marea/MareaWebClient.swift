//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import Bricolage
import Foundation

class MareaWebClient {
    private enum Constant {
        /// https://api.marea.ooo/doc/
        static let serviceURL = URL(string: "https://api.marea.ooo")!
    }

    private let webClient: EndpointInvoking

    init(webClient: EndpointInvoking) {
        self.webClient = webClient
    }

    convenience init(token: String) {
        let webClient = configure(WebClient(serviceURL: Constant.serviceURL)) {
            $0.additionalHeaders = ["x-marea-api-token": token]
        }
        self.init(webClient: webClient)
    }
}

// MARK: -

extension MareaWebClient: MareaClient {
    var stations: [StationListing] {
        get async throws {
            try await webClient.invoke(endpoint: ListStations())
        }
    }

    func station(for id: String) async throws -> Station {
        try await webClient.invoke(endpoint: GetStation(id: id))
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
        try await webClient.invoke(
            endpoint: GetTides(
                duration: duration,
                timestamp: timestamp,
                radius: radius,
                interval: interval,
                latitude: latitude,
                longitude: longitude,
                model: model.apiString,
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
        try await webClient.invoke(
            endpoint: GetTides(
                duration: duration,
                timestamp: timestamp,
                radius: nil,
                interval: interval,
                latitude: nil,
                longitude: nil,
                model: model.apiString,
                stationRadius: stationRadius,
                stationId: stationId,
                datum: datum
            )
        )
    }
}

// MARK: -

private extension Model {
    var apiString: String {
        switch self {
        case .fes2014:
            return "FES2014"
        case .eot20:
            return "EOT20"
        }
    }
}
