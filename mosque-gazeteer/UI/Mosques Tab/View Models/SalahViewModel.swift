//
//  SalahViewModel.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-08.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation

class SalahViewModel: Equatable {
    
    let name: String
    let time: Date
    
    init(name: String, time: Date) {
        self.name = name
        self.time = time
    }
    
    static func == (lhs: SalahViewModel, rhs: SalahViewModel) -> Bool {
        return lhs.name == rhs.name && lhs.time == rhs.time
    }
}

//extension SalahViewModel {
//    convenience init(_ salah: Salah) {
//        self.init(name: salah.name, time: salah.iqamah)
//    }
//}

extension SalahViewModel: Identifiable {}


extension SalahViewModel {
    static func bmViewModels() -> [SalahViewModel] {
        return [
            SalahViewModel(name: "Fajr", time: DateFormatter.localTimeFormat.date(from: "6:30 AM") ?? Date()),
            SalahViewModel(name: "Zuhr", time: DateFormatter.localTimeFormat.date(from: "2:00 PM") ?? Date()),
            SalahViewModel(name: "Asr", time: DateFormatter.localTimeFormat.date(from: "5:45 PM") ?? Date()),
            SalahViewModel(name: "Maghrib", time: DateFormatter.localTimeFormat.date(from: "7:14 PM") ?? Date()),
            SalahViewModel(name: "Isha", time: DateFormatter.localTimeFormat.date(from: "8:45 PM") ?? Date()),
        ]
    }
}
