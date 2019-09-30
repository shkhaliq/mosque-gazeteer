//
//  MosqueDetailView.swift
//  mosque-gazeteer
//
//  Created by Khaliq, Haris on 2019-09-28.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import SwiftUI

struct MosqueDetailView: View {
    
    var mosque: MosqueViewModel
    
    var body: some View {
        return VStack {
            Button(mosque.address) {
                
            }
            .font(.subheadline)
            .foregroundColor(.blue)
            Button("416-779-9753") {
                let tel = "tel://"
                let formattedString = tel + "4167799753"
                if let url = URL(string: formattedString) {
                    UIApplication.shared.open(url as URL)
                }
            }
            .foregroundColor(.blue)
        }
    }
}
