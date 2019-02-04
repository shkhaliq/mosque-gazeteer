//
//  LocationViewController.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-03.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit
import MapKit

class LocationViewController: UIViewController {

    private let mapView: MKMapView = MKMapView(frame: .zero)
    private let regionRadius: CLLocationDistance = 100000
    // GTA
    private let initialLocation = CLLocation(latitude: 43.638830778, longitude: -79.385665124)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mapView)
        mapView.frame = view.bounds
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        centerMapOnLocation(location: initialLocation)
    }

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius
        )
        mapView.setRegion(coordinateRegion, animated: true)
    }
}
