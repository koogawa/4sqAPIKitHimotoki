//
//  FoursquareRequestType.swift
//  4sqAPIKitHimotoki
//
//  Created by koogawa on 2016/05/29.
//  Copyright © 2016 koogawa. All rights reserved.
//

import APIKit
import Himotoki

protocol FoursquareRequestType: RequestType {

}

extension FoursquareRequestType {
    var baseURL: NSURL {
        return NSURL(string: "https://api.foursquare.com")!
    }
}

extension FoursquareRequestType where Response: Decodable {
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) throws -> Response {
        return try decodeValue(object)
    }
}

extension FoursquareRequestType {
    func interceptObject(object: AnyObject, URLResponse: NSHTTPURLResponse) throws -> AnyObject {
        return object
    }
}

struct GetVenueList : FoursquareRequestType {
    typealias Response = Resp

    var method: HTTPMethod {
        return .GET
    }

    var path: String {
        return "/v2/venues/search"
    }

    var parameters: AnyObject? {
        return [
            "ll": "35.6662026,139.7312591",
            "oauth_token": "(YOUR_OAUTH_TOKEN)",
            "v": "20160529",
        ]
    }

    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) throws -> Response {
        return try decodeValue(object, rootKeyPath: "response")
    }
}
