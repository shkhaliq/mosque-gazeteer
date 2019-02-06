//
//  MosqueDataClient.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-06.
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
        return components.url! //s
    }
}


extension Endpoint {

    static func fetchAllMosques() -> Endpoint {
        return Endpoint(path: "/mosques")
    }

    static func fetchMosque(for id: String) -> Endpoint {
        return Endpoint(path: "/mosques/\(id)")
    }

    static func fetchSalahs(for id: String) -> Endpoint {
        return Endpoint(path: "/mosques/\(id)/salahs")
    }
}

class MosqueDataClient {

    static let shared = MosqueDataClient()

    func fetchAllMosques(completionHandler: @escaping ([Mosque]?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: Endpoint.fetchAllMosques().url) { data, _, error in
            guard let data = data else {
                completionHandler(nil, error)
                return
            }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
            do {
                let json = try decoder.decode([Mosque].self, from: data)
                completionHandler(json, nil)
            } catch let error {
                print(error)
                completionHandler(nil, error)
            }

        }

        task.resume()
    }


//    func loadData(from endpoint: Endpoint,
//                  completionHandler: @escaping (Result) -> Void) {
//        guard let url = endpoint.url else {
//            completionHandler(.failure(NSError(domain: "dd", code: 400, userInfo: nil)))
//            return
//        }
}
