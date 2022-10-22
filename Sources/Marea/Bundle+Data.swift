//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import Foundation

public extension Bundle {
    var bundledStation: Station? {
        get throws {
            try url(forResource: "v2-stations-NOAA-9415112", withExtension: "json")
                .flatMap { try Data(contentsOf: $0) }
                .flatMap { try?JSONDecoder().decode(Station.self, from: $0) }
        }
    }

    var bundledTidesForModel: Tides? {
        get throws {
            try url(forResource: "v2-tides-model", withExtension: "json")
                .flatMap { try Data(contentsOf: $0) }
                .flatMap { try makeJSONDecoder().decode(Tides.self, from: $0) }
        }
    }

    var bundledTidesForStation: Tides? {
        get throws {
            try url(forResource: "v2-tides-station", withExtension: "json")
                .flatMap { try Data(contentsOf: $0) }
                .flatMap { try makeJSONDecoder().decode(Tides.self, from: $0) }
        }
    }

    var bundledStationsList: [StationListing]? {
        get throws {
            try url(forResource: "v2-stations", withExtension: "json")
                .flatMap { try Data(contentsOf: $0) }
                .flatMap { try JSONDecoder().decode([StationListing].self, from: $0) }
        }
    }
}
