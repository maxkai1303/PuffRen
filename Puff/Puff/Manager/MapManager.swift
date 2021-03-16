//
//  MapManager.swift
//  Puff
//
//  Created by Max Kai on 2021/3/10.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class MapManager {
    
    var locations: [MKPointAnnotation] = []
    
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
    
    
     func openMap(location: CLLocationCoordinate2D, targetName: String?) {
        
        let targetLocation = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        
        let targetPlacemark = MKPlacemark(coordinate: targetLocation)
        
        let targetItem = MKMapItem(placemark: targetPlacemark)
        
        let userMapItem = MKMapItem.forCurrentLocation()
        
        let routes = [userMapItem,targetItem]
        
        targetItem.name = targetName ?? "我愛泡芙人"
        
        MKMapItem.openMaps(with: routes, launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDefault])
    }
    
    // 地址轉經緯度
     func transformAdd(add: String, handler: @escaping(CLLocation) -> Void ) {
        
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(add) { placemarks, error in
            
            guard
                let placemark = placemarks,
                let location = placemark.first?.location
            
            else {
                
                print(#function, error!)
                return
            }
            
            handler(location)
        }
    }
}
