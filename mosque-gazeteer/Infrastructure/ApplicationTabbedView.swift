//
//  ApplicationTabbedView.swift
//  mosque-gazeteer
//
//  Created by Khaliq, Haris on 2019-09-22.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import SwiftUI

@available(iOS 13.0.0, *)
struct ApplicationTabbedView: View {
    
    @State var selection: Int = 1
    var mosques: [MosqueViewModel] = [
        MosqueViewModel(
            id: 1,
            name: "Baitul Mukarram Islamic Society",
            address: "3340 Danforth Ave, Scarborough, ON M1L 1C6"),
    ]
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                MosquesView(mosques: mosques)
                    .navigationBarTitle(Text("Mosques"))
            }
            .tabItem {
                Image(systemName: "moon")
                Text("Salah")
            }
            .tag(1)
            Text("Map")
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Location")
            }
            .tag(2)
            NavigationView {
                SignInView()
                    .navigationBarTitle("Account")
            }
            .tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("Account")
            }
            .tag(3)
        }
        .font(.headline)
        .accentColor(.green)
    }
}
