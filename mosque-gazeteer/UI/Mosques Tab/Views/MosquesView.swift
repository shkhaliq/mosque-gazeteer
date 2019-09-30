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
    
    var body: some View {
        List(mosques) { mosque in
            NavigationLink(destination: SalahView(mosque: mosque), label: {
                MosqueView(mosque: mosque)
            })
        }
    }
}

struct MosqueView: View {
    var mosque: MosqueViewModel
    
    var body: some View {
        Text(mosque.name)
            .fontWeight(.medium)
            .padding()
    }
}
