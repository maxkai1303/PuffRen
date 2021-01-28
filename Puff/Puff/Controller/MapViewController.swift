//
//  MapViewController.swift
//  Puff
//
//  Created by Max Kai on 2021/1/27.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapOutlet: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        mapOutlet.delegate = self
        mapOutlet.showsUserLocation = true
        mapOutlet.userTrackingMode = .follow
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
            
        locationManager.stopUpdatingLocation()
        
        }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        switch manager.authorizationStatus {
        
        case .authorizedAlways, .authorizedWhenInUse:
            
            print("使用者同意了")
        
            locationManager.startUpdatingLocation()
            
        default:
            
            print("使用者不同意")
            
            break
        }
    }
    
}
