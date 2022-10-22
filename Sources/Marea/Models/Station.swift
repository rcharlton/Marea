//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

public struct Station: Decodable {
    enum StationType: String, Decodable {
        case harmonic = "HARMONIC"
        case reference = "REFERENCE"
    }

    let status: UInt
    let id: String
    let name: String
    let latitude: Double
    let longitude: Double
    let provider: String
    let type: StationType
    let datums: Datums
    let timezone: String
}
