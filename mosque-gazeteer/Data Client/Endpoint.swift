//
//  Endpoint.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-08.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation

struct Endpoint {
    let path: String
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "localhost"
        components.port = 3000
        components.path = path
        let url = components.url! //swiftlint:disable:this force_unwrapping
        print(url.absoluteURL)
        return url
    }
}


extension Endpoint {

    static func fetchAllMosques() -> Endpoint {
        return Endpoint(path: "/mosques")
    }

    static func fetchMosque(for id: String) -> Endpoint {
        return Endpoint(path: "/mosques/\(id)")
    }

    static func fetchSalahs(for id: Int) -> Endpoint {
        return Endpoint(path: "/mosques/\(id)/salahs")
    }
}
