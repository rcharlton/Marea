//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import Foundation

extension Bundle {
    func jsonData(forResource name: String) throws -> Data? {
        try data(forResource: name, withExtension: "json")
    }

    func data(forResource name: String, withExtension ext: String) throws -> Data? {
        try url(forResource: name, withExtension: ext)
            .flatMap { try Data(contentsOf: $0) }
    }

    func jsonData(forResource name: String, subdirectory subpath: String?) throws -> Data? {
        try data(forResource: name, withExtension: "json", subdirectory: subpath)
    }

    func data(forResource name: String, withExtension ext: String, subdirectory subpath: String?) throws -> Data? {
        try url(forResource: name, withExtension: ext, subdirectory: subpath)
            .flatMap { try Data(contentsOf: $0) }
    }
}
