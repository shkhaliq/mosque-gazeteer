//
//  MosquesView.swift
//  mosque-gazeteer
//
//  Created by Khaliq, Haris on 2019-09-22.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import SwiftUI

struct MosquesView: View {
    var mosques: [MosqueViewModel]
    var salahs: [SalahViewModel] = [
        SalahViewModel(name: "Fajr", time: Date()),
        SalahViewModel(name: "Zuhr", time: Date()),
        SalahViewModel(name: "Asr", time: Date()),
        SalahViewModel(name: "Maghrib", time: Date()),
        SalahViewModel(name: "Isha", time: Date()),
    ]
    
    var body: some View {
        List(mosques) { mosque in
            NavigationLink(destination: SalahView(salahs: self.salahs), label: {
                MosqueView(mosque: mosque)
            })
        }
    }
}
