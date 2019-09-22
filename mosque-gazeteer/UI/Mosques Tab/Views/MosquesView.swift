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
            MosqueView(mosque: mosque)
        }
    }
}
