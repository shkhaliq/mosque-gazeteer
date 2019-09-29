//
//  Mosques.swift
//  mosque-gazeteer
//
//  Created by Khaliq, Haris on 2019-09-29.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation

struct Mosques {
    
    private let baitulMukarram: [String: Date] = [
        "Fajr": DateFormatter.localTimeFormat.date(from: "6:30 AM") ?? Date(),
        "Zuhr": DateFormatter.localTimeFormat.date(from: "2:00 PM") ?? Date(),
        "Asr": DateFormatter.localTimeFormat.date(from: "5:45 PM") ?? Date(),
        "Maghrib": DateFormatter.localTimeFormat.date(from: "7:14 PM") ?? Date(),
        "Isha": DateFormatter.localTimeFormat.date(from: "8:45 PM") ?? Date(),
    ]
    
    func load() {
        save(
            id: 1,
            name: "Baitul Mukarram Masjid",
            phoneNumber: 4166863037,
            address: "3334 Danforth Ave Toronto, ON, M1l 1C6",
            longitude: -79.277703,
            latitude: 43.693796,
            allSalahs: baitulMukarram
        )

        save(
            id: 2,
            name: "Baitul Aman Masjid",
            phoneNumber: 4166863037,
            address: "3334 Danforth Ave Toronto, ON, M1l 1C6",
            longitude: -79.287538,
            latitude: 43.691420,
            allSalahs: baitulMukarram
        )
    }
    //swiftlint:disable:next function_parameter_count
    private func save(
        id: Int64,
        name: String,
        phoneNumber: Int64,
        address: String,
        longitude: Double,
        latitude: Double,
        allSalahs: [String: Date]
    ) {
        guard let mosque = MosqueDataCoordinator.shared.mosque.create() else { return }
        mosque.name = name
        mosque.phoneNumber = phoneNumber
        mosque.address = address
        mosque.longitude = longitude
        mosque.latitude = latitude
        mosque.id = id
        
        let salahs: [Salah] = allSalahs.enumerated().compactMap { (index, arg1) in
            let (key, value) = arg1
            let salah = MosqueDataCoordinator.shared.salah.create()
            salah?.id = Int64(index)
            salah?.name = key
            salah?.iqamah = value
            return salah
        }
        salahs.forEach({ mosque.addToSalahs($0) })
        
        _ = MosqueDataCoordinator.shared.mosque.addOrUpdate(mosque)
    }
}
