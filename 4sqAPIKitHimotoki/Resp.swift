//
//  Response.swift
//  4sqAPIKitHimotoki
//
//  Created by koogawa on 2016/05/29.
//  Copyright © 2016 koogawa. All rights reserved.
//

import Himotoki

struct Resp {
    var venues: [Venue]
}

extension Resp: Decodable {
    static func decode(e: Extractor) throws -> Resp {
        return try Resp (
            venues: e <|| "venues"
        )
    }
}
