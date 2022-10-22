//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import Foundation

public struct Tides: Decodable {
    public struct Origin: Decodable {
        public struct Station: Decodable {
            public let id: String
            public let name: String
            public let provider: String
        }

        public let latitude: Double
        public let longitude: Double

        /// Origin distance from requested coordinates.
        public let distance: Double
        public let unit: String
        public let station: Station?
    }

    public struct Extreme: Decodable {
        public enum State: String, Decodable {
            case lowTide = "LOW TIDE"
            case highTide = "HIGH TIDE"
        }
        public let timestamp: UInt
        public let datetime: Date
        public let height: Double
        public let state: State
    }

    public struct Height: Decodable {
        public enum State: String, Decodable {
            case falling = "FALLING"
            case rising = "RISING"
        }
        public let timestamp: UInt
        public let datetime: Date
        public let height: Double
        public let state: State
    }

    public enum Source: String, Decodable {
        case station = "STATION"
        case fes2014 = "FES2014"
        case eot20 = "EOT20"
    }

    public let disclaimer: String

    /// Response status.
    public let status: UInt

    /// Requested coordinate.
    public let latitude: Double
    public let longitude: Double

    /// Nearest location for requested coordinates with tide predictions available.
    public let origin: Origin

    /// Tidal datums.
    public let datums: Datums

    /// Requested timestamp.
    public let timestamp: UInt

    /// Timestamp as in timezone specified in timezone field.
    public let datetime: Date

    /// Unit for the prediction heights.
    public let unit: String

    /// Datetime timezone.
    public let timezone: String

    /// Reference Tidal datum.
    public let datum: String

    /// List of low and high tides.
    public let extremes: [Extreme]

    /// List of water levels with requested interval.
    public let heights: [Height]

    /// Prediction source: either model (FES2014, EOT20) OR "STATION".
    public let source: Source

    /// Prediction source copyright.
    public let copyright: String
}
