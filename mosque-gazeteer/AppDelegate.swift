//
//  AppDelegate.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-01-28.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var services: [ApplicationService] {
        return [FirebaseService()]
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        for service in services {
            _ = service.application?(application, didFinishLaunchingWithOptions: launchOptions)
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        for service in services {
            service.applicationWillResignActive?(application)
        }
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        for service in services {
            service.applicationDidEnterBackground?(application)
        }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        for service in services {
            service.applicationWillEnterForeground?(application)
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        for service in services {
            service.applicationDidBecomeActive?(application)
        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        for service in services {
            service.applicationWillTerminate?(application)
        }
    }


}

