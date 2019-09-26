//
//  LocationRequestService.swift
//  mosque-gazeteer
//
//  Created by Khaliq, Haris on 2019-09-25.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class LocationRequestService: NSObject, ApplicationService {
    
    private let locationManager = CLLocationManager()
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        locationManager.requestLocation()
        
        return true
    }
}
