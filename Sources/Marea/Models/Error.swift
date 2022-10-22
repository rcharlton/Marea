//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

public struct Error: Decodable {
    let message: String
    let statusCode: Int

    enum CodingKeys: String, CodingKey {
        case message = "error"
        case statusCode = "status"
    }
}
