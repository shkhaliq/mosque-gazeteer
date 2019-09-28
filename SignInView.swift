//
//  SignInView.swift
//  mosque-gazeteer
//
//  Created by Khaliq, Haris on 2019-09-21.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import SwiftUI

struct SignInView: View {
    
    @State private var userName: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
        VStack {
            TextField("Username", text: $userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(16.0)
            SecureField("Password", text: $password)
                .padding(16.0)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                
            }, label: {
                VStack {
                    Text("Sign In")
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(5)
            })
            Button(action: {
                
            }, label: {
                VStack {
                    Text("Create Account")
                        .foregroundColor(.blue)
                }
                .padding()
                .background(Color.gray.opacity(0.5))
                .cornerRadius(5)
            })
        }
    }
}
