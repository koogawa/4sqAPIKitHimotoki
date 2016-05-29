//
//  Venue.swift
//  4sqAPIKitHimotoki
//
//  Created by koogawa on 2016/05/29.
//  Copyright © 2016 koogawa. All rights reserved.
//

import Himotoki

struct Venue {
    var id: String
    var name: String
}

extension Venue: Decodable {
    static func decode(e: Extractor) throws -> Venue {
        return try Venue (
            id: e <| "id",
            name: e <| "name"
        )
    }
}
