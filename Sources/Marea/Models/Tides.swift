//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import Foundation

public struct Tides: Decodable {
    struct Origin: Decodable {
        struct Station: Decodable {
            let id: String
            let name: String
            let provider: String
        }

        let latitude: Double
        let longitude: Double

        /// Origin distance from requested coordinates.
        let distance: Double
        let unit: String
        let station: Station?
    }

    struct Extreme: Decodable {
        enum State: String, Decodable {
            case lowTide = "LOW TIDE"
            case highTide = "HIGH TIDE"
        }
        let timestamp: UInt
        let datetime: Date
        let height: Double
        let state: State
    }

    struct Height: Decodable {
        enum State: String, Decodable {
            case falling = "FALLING"
            case rising = "RISING"
        }
        let timestamp: UInt
        let datetime: Date
        let height: Double
        let state: State
    }

    enum Source: String, Decodable {
        case station = "STATION"
        case fes2014 = "FES2014"
        case eot20 = "EOT20"
    }

    let disclaimer: String

    /// Response status.
    let status: UInt

    /// Requested coordinate.
    let latitude: Double
    let longitude: Double

    /// Nearest location for requested coordinates with tide predictions available.
    let origin: Origin

    /// Tidal datums.
    let datums: Datums

    /// Requested timestamp.
    let timestamp: UInt

    /// Timestamp as in timezone specified in timezone field.
    let datetime: Date

    /// Unit for the prediction heights.
    let unit: String

    /// Datetime timezone.
    let timezone: String

    /// Reference Tidal datum.
    let datum: String

    /// List of low and high tides.
    let extremes: [Extreme]

    /// List of water levels with requested interval.
    let heights: [Height]

    /// Prediction source: either model (FES2014, EOT20) OR "STATION".
    let source: Source

    /// Prediction source copyright.
    let copyright: String
}
