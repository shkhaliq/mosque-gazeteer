//
//  ApplicationLaunchService.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-30.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit
import SwiftUI

class ApplicationLaunchService: NSObject, ApplicationService {

    private var coordinator: LaunchCoordinator?
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        if #available(iOS 13.0.0, *) {
            window?.rootViewController = UIHostingController(rootView: ApplicationTabbedView())
        }
        window?.makeKeyAndVisible()
        return true
    }
}
