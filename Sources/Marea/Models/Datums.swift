//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

/// https://tidesandcurrents.noaa.gov/datum_options.html
public struct Datums: Decodable, Equatable {
    /// Mean Diurnal High Water Inequality.
    /// One-half the average difference between the two high waters of each tidal day
    /// observed over the National Tidal Datum Epoch. It is obtained by subtracting the
    /// mean of all the high waters from the mean of the higher high waters.
    public let dhq: Double

    /// Mean Diurnal Low Water Inequality.
    /// One-half the average difference between the two low waters of each tidal day
    /// observed over the National Tidal Datum Epoch. It is obtained by subtracting the
    /// mean of the lower low waters from the mean of all the low waters.
    public let dlq: Double

    /// Diurnal Tide Level.
    /// The arithmetic mean of mean higher high water and mean lower low water.
    public let dtl: Double

    /// Great Diurnal Range.
    /// The difference in height between mean higher high water and mean lower low water.
    public let gt: Double

    /// Highest Astronomical Tide.
    /// The elevation of the highest predicted astronomical tide expected to occur at a
    /// specific tide station over the National Tidal Datum Epoch.
    public let hat: Double

    /// Lowest Astronomical Tide.
    /// The elevation of the lowest astronomical predicted tide expected to occur at a
    /// specific tide station over the National Tidal Datum Epoch.
    public let lat: Double

    /// Mean Higher High Water.
    /// The average of the higher high water height of each tidal day observed over the
    /// National Tidal Datum Epoch. For stations with shorter series, comparison of
    /// simultaneous observations with a control tide station is made in order to derive
    /// the equivalent datum of the National Tidal Datum Epoch.
    public let mhhw: Double

    /// Mean High Water.
    /// The average of all the high water heights observed over the National Tidal Datum
    /// Epoch. For stations with shorter series, comparison of simultaneous observations
    /// with a control tide station is made in order to derive the equivalent datum of
    /// the National Tidal Datum Epoch.
    public let mhw: Double

    /// Mean Lower Low Water.
    /// The average of the lower low water height of each tidal day observed over the
    /// National Tidal Datum Epoch. For stations with shorter series, comparison of
    /// simultaneous observations with a control tide station is made in order to derive
    /// the equivalent datum of the National Tidal Datum Epoch.
    public let mllw: Double

    /// Mean Low Water.
    /// The average of all the low water heights observed over the National Tidal Datum
    /// Epoch. For stations with shorter series, comparison of simultaneous observations
    /// with a control tide station is made in order to derive the equivalent datum of
    /// the National Tidal Datum Epoch.
    public let mlw: Double

    /// Mean Range of Tide.
    /// The difference in height between mean high water and mean low water.
    public let mn: Double

    /// Mean Tide Level.
    /// The arithmetic mean of mean high water and mean low water.
    public let mtl: Double

    public enum CodingKeys: String, CodingKey {
        case dhq = "DHQ"
        case dlq = "DLQ"
        case dtl = "DTL"
        case gt = "GT"
        case hat = "HAT"
        case lat = "LAT"
        case mhhw = "MHHW"
        case mhw = "MHW"
        case mllw = "MLLW"
        case mlw = "MLW"
        case mn = "MN"
        case mtl = "MTL"
    }
}

// hwi
