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
    var salahs: [SalahViewModel] = SalahViewModel.bmViewModels()
    
    var body: some View {
        List(mosques) { mosque in
            NavigationLink(destination: SalahView(salahs: self.salahs), label: {
                MosqueView(mosque: mosque)
            })
        }
    }
}
