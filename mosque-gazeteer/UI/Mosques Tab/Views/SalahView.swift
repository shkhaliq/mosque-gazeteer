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
                SalahItemView(salah: salah)
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(mosque.name)
            .navigationBarItems(trailing: Image(systemName: "pencil"))
        }
    }
}

struct SalahItemView: View {
    
    let salah: SalahViewModel
    
    var body: some View {
        HStack {
            Text(salah.name).font(.body)
            Spacer()
            Text("\(salah.iqamah, formatter: DateFormatter.localTimeFormat)")
                .font(.largeTitle)
                .listRowBackground(Color.green)
        }
    }
}
