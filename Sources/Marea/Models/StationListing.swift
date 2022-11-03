//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

public struct StationListing: Decodable, Equatable {
    public let id: String
    public let name: String
    public let country: String?
    public let latitude: Double
    public let longitude: Double
}
