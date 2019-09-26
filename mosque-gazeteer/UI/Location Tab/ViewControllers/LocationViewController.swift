//
//  LocationViewController.swift
//  mosque-gazeteer
//
//  Created by Haris Khaliq on 2019-02-03.
//  Copyright © 2019 HarisKhaliq. All rights reserved.
//

import UIKit
import MapKit
import SwiftUI

struct LocationViewModel {
    let latitude: Double
    let longitude: Double
    let title: String?
}

class LocationViewController: UIViewController {
    
    private let mapView: MKMapView = MKMapView(frame: .zero)
    private let regionRadius: CLLocationDistance = 100000
    // GTA
    private let initialLocation = CLLocation(latitude: 43.693796, longitude: -79.277703)
    
    private var annotations: [MKPointAnnotation]
    
    private let locationManager = CLLocationManager()
    
    init(locations: [LocationViewModel]) {
        self.annotations = locations.map { location in
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            annotation.title = location.title
            return annotation
        }
        super.init(nibName: nil, bundle: nil)
        requestLocationServices()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mapView)
        mapView.frame = view.bounds
        mapView.delegate = self
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        centerMapOnLocation(location: initialLocation)
        mapView.showAnnotations(annotations, animated: true)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius
        )
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    private func requestLocationServices() {
        if CLLocationManager.locationServicesEnabled() == false {
            let pointAnnotation = MKPointAnnotation()
            if let coordinate = locationManager.location?.coordinate {
                pointAnnotation.coordinate = coordinate
                pointAnnotation.title = "Current Location"
                mapView.addAnnotation(pointAnnotation)
            }
        }
    }
}

extension LocationViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "annotationView")
        annotationView.canShowCallout = true
        annotationView.rightCalloutAccessoryView = UIButton(type: UIButton.ButtonType.detailDisclosure)
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView,
                 annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        let salahs: [SalahViewModel] = [
            SalahViewModel(name: "Fajr", time: Date()),
            SalahViewModel(name: "Zuhr", time: Date()),
            SalahViewModel(name: "Asr", time: Date()),
            SalahViewModel(name: "Maghrib", time: Date()),
            SalahViewModel(name: "Isha", time: Date()),
        ]
        let controller = UIHostingController(rootView: SalahView(salahs: salahs))
        present(controller, animated: true, completion: nil)
    }
}

struct SuperLocationViewController: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = LocationViewController
    
    var locations: [LocationViewModel]
    
    func makeUIViewController(
        context: UIViewControllerRepresentableContext<SuperLocationViewController>) -> LocationViewController {
        return LocationViewController(locations: locations)
    }
    
    func updateUIViewController(_ uiViewController: LocationViewController,
                                context: UIViewControllerRepresentableContext<SuperLocationViewController>) {
        
    }
}

struct SuperLocationViewControllerView: View {
    
    var locations: [LocationViewModel]
    
    var body: some View {
        return SuperLocationViewController(locations: locations)
    }
}
