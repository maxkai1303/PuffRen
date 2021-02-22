//
//  MapViewController.swift
//  Puff
//
//  Created by Max Kai on 2021/1/27.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapOutlet: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var locations: [MKPointAnnotation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.distanceFilter = kCLLocationAccuracyNearestTenMeters
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        mapOutlet.delegate = self
        mapOutlet.showsUserLocation = true
        mapOutlet.userTrackingMode = .follow
        
        setPoint()
        setMapView()
        setupUserTrackingButtonAndScaleView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestLocation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        locationManager.stopUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        switch manager.authorizationStatus {
        
        case .authorizedAlways, .authorizedWhenInUse:
            
            print("使用者同意了")
            
            locationManager.startUpdatingLocation()
            
        case .denied:
            
            let alertController = UIAlertController(
                
                title: "定位權限已關閉",
                message:
                    "如要變更權限，請至 設定 > 隱私權 > 定位服務 開啟 我愛泡芙人 定位",
                preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "確認", style: .default, handler:nil)
            
            alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        default:
            
            print("使用者不同意")
            
            break
        }
    }
    
    func setPoint() {
        
        setPointArray()
        
        for annotation in locations {
            
            DispatchQueue.main.async {
                
                self.mapOutlet.addAnnotation(annotation)
            }
        }
    }
    
    func setPointArray() {
        
        let school = MKPointAnnotation()
        
        school.title = "實踐國小"
        
        school.coordinate = CLLocationCoordinate2D(latitude: 24.983413, longitude: 121.558051)
        
        school.subtitle = "Max的國小"
        
        locations.append(school)
        
        
        let jDSchool = MKPointAnnotation()
        
        jDSchool.title = "NTU"
        
        jDSchool.coordinate = CLLocationCoordinate2D(latitude: 25.018116, longitude: 121.538293)
        
        jDSchool.subtitle = "阿雙的學校"
        
        locations.append(jDSchool)
        
        let puffOffice = MKPointAnnotation()
        
        puffOffice.title = "我愛泡芙人"
        
        puffOffice.coordinate = CLLocationCoordinate2D(latitude: 24.994791, longitude: 121.295924)
        
        puffOffice.subtitle = "泡芙人的誠信原則 無添加任何防腐劑及香精 大朋友、小朋友都吃的安心的美味甜點"
        
        locations.append(puffOffice)
        
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

        NSLayoutConstraint.activate([button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
                                     button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                                     scale.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -20),
                                     scale.centerYAnchor.constraint(equalTo: button.centerYAnchor)])
    }
    
    func openMap(latitude: Double, longitude: Double) {
        
        let targetLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        //初始化使用MKPlacemark
        let targetPlacemark = MKPlacemark(coordinate: targetLocation)
        
        let targetItem = MKMapItem(placemark: targetPlacemark)
        
        let userMapItem = MKMapItem.forCurrentLocation()
        
        let routes = [userMapItem,targetItem]
        
        MKMapItem.openMaps(with: routes, launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDefault])
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
        
        print(error)
    }
    
}

// MARK: - MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let userLocation = locationManager.location?.coordinate
        
        if annotation.coordinate.latitude == userLocation?.latitude
            && annotation.coordinate.longitude == userLocation?.longitude {
            
            return nil
        }
        
        return nil
        
//        if let temp = annotation as? MKAnnotation {
//
//            var storeMap = mapView.dequeueReusableAnnotationView(withIdentifier: "pin")
//
//            if storeMap == nil {
//
//                storeMap = MKAnnotationView(annotation: temp, reuseIdentifier: "pin")
//
//                storeMap?.image = UIImage(named: "placeholder")
//
//                storeMap?.canShowCallout = true
//
//                storeMap?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//
//            } else {
//
//                storeMap?.annotation = annotation
//            }
//
//            return storeMap
//
//        }
    }
    
    func mapView(_ mapView: MKMapView,annotationView view: MKAnnotationView,calloutAccessoryControlTapped control: UIControl) {
        
        guard let placemark = view.annotation as? MKPointAnnotation else { return }
        
        openMap(latitude: placemark.coordinate.latitude, longitude: placemark.coordinate.longitude)
        
    }
}

/*
 1. 導航好了，但是導航點的 name 會顯示 unknow location
 2. 自己的位置我還是沒辦法換成預設的藍色點點，會吃到我自定義的圖片
 */
