//
//  ApplicationCoreDataService.swift
//  mosque-gazeteer
//
//  Created by Khaliq, Haris on 2019-09-29.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation
import UIKit

class ApplicationCoreDataService: NSObject, ApplicationService {

    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {

        Mosques().load()
        return true
    }
}
