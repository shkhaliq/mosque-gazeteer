//
//  SalahView.swift
//  mosque-gazeteer
//
//  Created by Khaliq, Haris on 2019-09-22.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import SwiftUI

struct SalahView: View {
    let mosque: MosqueViewModel
    
    var body: some View {
        VStack {
            MosqueDetailView(mosque: mosque)
            List(mosque.salahs) { salah in
                HStack {
                    Text(salah.name).font(.subheadline)
                    Spacer()
                    Text("\(salah.iqamah, formatter: DateFormatter.localTimeFormat)")
                        .font(.headline)
                }
            }
        }
    }
}
