//
//  ApplicationTabbedView.swift
//  mosque-gazeteer
//
//  Created by Khaliq, Haris on 2019-09-22.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import SwiftUI

struct ApplicationTabbedView: View {
    
    @State var selection: Int = 1
    var mosques: [MosqueViewModel] = [
        MosqueViewModel(
            id: 1,
            name: "Baitul Mukarram Islamic Society",
            address: "3340 Danforth Ave, Scarborough, ON M1L 1C6"),
    ]
    
    var locations: [LocationViewModel] = [
        LocationViewModel(latitude: 43.693796, longitude: -79.277703, title: "Baitul Mukarram Masjid"),
        LocationViewModel(latitude: 43.691420, longitude: -79.287538, title: "Baitul Aman Masjid"),
    ]
    
    var body: some View {
        TabView(selection: $selection) {
            SuperLocationViewControllerView(locations: locations)
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Location")
            }
            .tag(1)
            NavigationView {
                MosquesView(mosques: mosques)
                    .navigationBarTitle(Text("Mosques"))
                    .navigationBarItems(trailing: Image(systemName: "plus.circle"))
            }
            .tabItem {
                Image(systemName: "moon")
                Text("Salah")
            }
            .tag(2)
            NavigationView {
                SignInView()
                    .navigationBarTitle("Account")
                    .navigationBarItems(trailing: Image(systemName: "wrench"))
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
