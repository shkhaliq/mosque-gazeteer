//
//  MosqueView.swift
//  mosque-gazeteer
//
//  Created by Khaliq, Haris on 2019-09-22.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import SwiftUI

struct MosqueView: View {
    var mosque: MosqueViewModel
    
    var body: some View {
        Text(mosque.name)
            .fontWeight(.medium)
            .padding()
    }
}
