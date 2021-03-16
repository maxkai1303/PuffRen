//
//  MapViewController.swift
//  Puff
//
//  Created by Max Kai on 2021/1/27.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: BaseViewController {
    
    @IBOutlet weak var mapOutlet: MKMapView!
    
    @IBOutlet weak var switchSegmented: UISegmentedControl!
    
    let locationManager = CLLocationManager()
    
    let mapManager = MapManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        mapOutlet.delegate = self
        mapOutlet.showsUserLocation = true
        mapOutlet.userTrackingMode = .follow
        
        setMapView()
        setupUserTrackingButtonAndScaleView()
    }
    
    override var navigationBarTitle: String {
        
        return "攤商地圖"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        locationManager.requestAlwaysAuthorization()
        
        locationManager.requestLocation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setPoint()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
    
        case .authorizedAlways, .authorizedWhenInUse:
        
            print("使用者同意了")
        
            locationManager.startUpdatingLocation()
            
        case .denied:
            
            let alertController = UIAlertController(title: "定位權限已關閉",
                                                    message: "如要變更權限，請至 設定 - 隱私權 - 定位服務 開啟 我愛泡芙人 定位",
                                                    preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "確認", style: .default, handler:nil)
            
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        default:
            
            print("使用者不同意")
            
            break
        }
    }
    
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
//        switch manager.authorizationStatus {
//
//        case .authorizedAlways, .authorizedWhenInUse:
//
//            print("使用者同意了")
//
//            locationManager.startUpdatingLocation()
//
//        case .denied:
//
//            let alertController = UIAlertController(
//
//                title: "定位權限已關閉",
//                message:
//                    "如要變更權限，請至 設定 > 隱私權 > 定位服務 開啟 我愛泡芙人 定位",
//                preferredStyle: .alert)
//
//            let okAction = UIAlertAction(title: "確認", style: .default, handler:nil)
//
//            alertController.addAction(okAction)
//
//            self.present(alertController, animated: true, completion: nil)
//
//        default:
//
//            print("使用者不同意")
//
//            break
//        }
//    }
    
    func setPoint() {
        // 設定假資料陣列
        mapManager.setPointArray()
        
        for annotation in mapManager.locations {
            
            DispatchQueue.main.async {
                
                self.mapOutlet.addAnnotation(annotation)
            }
        }
    }
    
    
    // 以台灣中心點顯示整個台灣地圖
    func setMapView() {
        
        let center = CLLocation(latitude: 23.706602, longitude: 121.017179)
        
        let currentRegion = MKCoordinateRegion(center: center.coordinate, latitudinalMeters: 250000, longitudinalMeters: 250000)
        
        mapOutlet.setRegion(currentRegion, animated: true)
        
    }
    
    func setupUserTrackingButtonAndScaleView() {

        let button = MKUserTrackingButton(mapView: mapOutlet)
        
        button.layer.backgroundColor = UIColor(white: 1, alpha: 0.8).cgColor
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        let scale = MKScaleView(mapView: mapOutlet)
        scale.legendAlignment = .trailing
        scale.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scale)

        NSLayoutConstraint.activate(
            [button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
             button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
             scale.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -20),
             scale.centerYAnchor.constraint(equalTo: button.centerYAnchor)]
        )
    }
    
}
// MARK: - CLLocationManagerDelegate

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
         
            print("Location data received.")
            
            print(location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print(#function, error)
    }
}

// MARK: - MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation.isKind(of: MKUserLocation.self) { return nil }
        
        let annotationIdentifier = "pin"
        
        var storeMap = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        
        storeMap = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
        
        storeMap?.image = UIImage(named: "Placeholder")
        
        storeMap?.canShowCallout = true
        
        storeMap?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        
        return storeMap
    }
    
    func mapView(_ mapView: MKMapView,annotationView view: MKAnnotationView,calloutAccessoryControlTapped control: UIControl) {
        
        guard let placemark = view.annotation as? MKPointAnnotation else { return }
        
        mapManager.openMap(location: placemark.coordinate, targetName: placemark.title)
    }
}
