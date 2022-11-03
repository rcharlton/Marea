//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import Bricolage
import Foundation

enum Constant {
    static let baseURL = URL(string: "BASE://URL")!
}

extension Bundle {
    func jsonData(forResource name: String) throws -> Data {
        if let data = try data(forResource: name, withExtension: "json") {
            return data
        } else {
            return Data()
        }
    }

    func data(forResource name: String, withExtension ext: String) throws -> Data? {
        try url(forResource: name, withExtension: ext, subdirectory: "Data")
            .flatMap { try Data(contentsOf: $0) }
    }
}

extension ResponseDecoding where Success: Decodable {
    func decodeSuccess(from data: Data) throws -> Success {
        try decodeSuccess(from: data, response: HTTPURLResponse())
    }
}

extension ResponseDecoding where Failure: Decodable {
    func decodeFailure(from data: Data) throws -> Failure {
        try decodeFailure(from: data, response: HTTPURLResponse())
    }
}
