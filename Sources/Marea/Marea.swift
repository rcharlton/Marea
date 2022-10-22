//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

import Bricolage
import Foundation

/// https://api.marea.ooo/doc/
private enum Constant {
    static let serviceURL = URL(string: "https://api.marea.ooo")!
}

public func makeClient(token: String) -> EndpointInvoking {
    configure(WebClient(serviceURL: Constant.serviceURL)) {
        $0.additionalHeaders = ["x-marea-api-token": token]
    }
}
