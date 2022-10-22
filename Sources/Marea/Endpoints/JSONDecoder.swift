//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import Bricolage
import Foundation

public func makeJSONDecoder() -> JSONDecoder {
    configure(JSONDecoder()) {
        $0.dateDecodingStrategy = .iso8601
    }
}
