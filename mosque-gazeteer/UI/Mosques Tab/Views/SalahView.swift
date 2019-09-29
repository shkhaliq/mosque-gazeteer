//
//  SalahView.swift
//  mosque-gazeteer
//
//  Created by Khaliq, Haris on 2019-09-22.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import SwiftUI

struct SalahView: View {
    let salahs: [SalahViewModel]
    let mosque: MosqueViewModel
    
    var locations: [LocationViewModel] = [
        LocationViewModel(latitude: 43.693796, longitude: -79.277703, title: "Baitul Mukarram Masjid"),
    ]
    
    var body: some View {
        VStack {
            MosqueDetailView(mosque: mosque)
            List(salahs) { salah in
                HStack {
                    Text(salah.name).font(.subheadline)
                    Spacer()
                    Text("\(salah.time, formatter: DateFormatter.localTimeFormat)")
                        .font(.headline)
                }
            }
        }
    }
}
