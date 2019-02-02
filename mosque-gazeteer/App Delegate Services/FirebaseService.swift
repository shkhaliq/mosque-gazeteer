//
//  FirebaseService.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-28.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation
import Firebase

class FirebaseService: NSObject, ApplicationService {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
}
