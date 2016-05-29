//
//  Responses.swift
//  4sqAPIKitHimotoki
//
//  Created by koogawa on 2016/05/29.
//  Copyright © 2016 koogawa. All rights reserved.
//

import Himotoki

struct Responses {
    var response: Resp
}

extension Responses: Decodable {
    static func decode(e: Extractor) throws -> Responses {
        return try Responses (
            response: e <| "response"
        )
    }
}
