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
    private var currentLocation = CLLocation(latitude: 43.693796, longitude: -79.277703)
    
    private var annotations: [MKPointAnnotation]
    
    
    private lazy var locationManager: CLLocationManager = {
        let manager =  CLLocationManager()
        manager.delegate = self
        return manager
    }()
    
    init(locations: [LocationViewModel]) {
        self.annotations = locations.map { location in
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            annotation.title = location.title
            return annotation
        }
        super.init(nibName: nil, bundle: nil)
        locationManager.requestWhenInUseAuthorization()
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
        mapView.showsCompass = true
        mapView.showsUserLocation = true
        mapView.showAnnotations(annotations, animated: true)
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let center = CLLocationCoordinate2D(
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude
        )
        let coordinateRegion = MKCoordinateRegion(
            center: center,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
        mapView.setRegion(coordinateRegion, animated: false)
    }
}

extension LocationViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView: MKPinAnnotationView

        if annotation is MKUserLocation {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "annotationView")
            annotationView.animatesDrop = true
            annotationView.pinTintColor = UIColor.green
        } else {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "annotationView")
            annotationView.canShowCallout = true
            annotationView.rightCalloutAccessoryView = UIButton(type: UIButton.ButtonType.detailDisclosure)
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView,
                 annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        let salahs: [SalahViewModel] = SalahViewModel.bmViewModels()
        let controller = UIHostingController(rootView: SalahView(salahs: salahs))
        present(controller, animated: true, completion: nil)
    }
}

extension LocationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last, currentLocation.distance(from: location) > kCLLocationAccuracyKilometer {
            currentLocation = location
            centerMapOnLocation(location: location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
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
