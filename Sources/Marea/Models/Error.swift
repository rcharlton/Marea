//
// Copyright © 2022 Robin Charlton. All rights reserved.
//

public struct Error: Decodable, Equatable {
    public let message: String
    public let statusCode: Int

    enum CodingKeys: String, CodingKey {
        case message = "error"
        case statusCode = "status"
    }

    public init(message: String, statusCode: Int) {
        self.message = message
        self.statusCode = statusCode
    }
}
