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
    var mosques: [MosqueViewModel] = MosqueDataCoordinator.shared.mosque.getAll().compactMap({ MosqueViewModel($0) })
    
    var body: some View {
        TabView(selection: $selection) {
            SuperLocationViewControllerView(locations: [])
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Location")
            }
            .tag(1)
            NavigationView {
                MosquesView(mosques: mosques)
                    .navigationBarTitle(Text("Mosques"))
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
