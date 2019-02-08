//
//  MosqueDataClient.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-06.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation

protocol MosqueDataClientType {
    func fetchAllMosques(completionHandler: @escaping ([Mosque]?, Error?) -> Void)
    func fetchAllSalahs(for id: Int, completionHandler: @escaping ([Salah]?, Error?) -> Void)
}

class MosqueDataClient: MosqueDataClientType {

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

    func fetchAllSalahs(for id: Int, completionHandler: @escaping ([Salah]?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: Endpoint.fetchSalahs(for: id).url) { data, _, error in
            guard let data = data else {
                completionHandler(nil, error)
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
            do {
                let json = try decoder.decode([Salah].self, from: data)
                completionHandler(json, nil)
            } catch let error {
                print(error)
                completionHandler(nil, error)
            }

        }

        task.resume()
    }
}
