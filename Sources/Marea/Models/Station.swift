//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

public struct Station: Decodable, Equatable {
    public enum StationType: String, Decodable, Equatable {
        case harmonic = "HARMONIC"
        case reference = "REFERENCE"
    }

    public let status: UInt
    public let id: String
    public let name: String
    public let latitude: Double
    public let longitude: Double
    public let provider: String
    public let type: StationType
    public let datums: Datums
    public let timezone: String
}
