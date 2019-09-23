//
//  SalahView.swift
//  mosque-gazeteer
//
//  Created by Khaliq, Haris on 2019-09-22.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import SwiftUI

struct SalahView: View {
    var salahs: [SalahViewModel]
    
    var body: some View {
        VStack {
            Text("Timings").font(.headline)
            List(salahs) { salah in
                HStack {
                    Text(salah.name)
                    Spacer()
                    Text("\(salah.time, formatter: DateFormatter.localTimeFormat)").font(.subheadline)
                }
            }
            .listStyle(.grouped)
        }
    }
}
