# Marea

Swift package to provide support for the Marea Tides (API)[https://api.marea.ooo].

Currently work in-progress; no releases yet.

## Basic Usage

```swift
import Marea

let marea = makeMareaClient(token: "<YOUR-API-TOKEN>")

let stationsList = try await marea.stations

let station = try await marea.station(for: stationsList[0].id)

let tides = try await marea.tides(stationId: station.id)

```
