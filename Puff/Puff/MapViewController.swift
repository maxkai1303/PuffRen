//
//  MapViewController.swift
//  Puff
//
//  Created by Max Kai on 2021/1/27.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMap()
    }
    
    @IBOutlet weak var mapOutlet: MKMapView!
    
    func setMap() {
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = CLLocationCoordinate2DMake(35.681236, 139.767125)
        
        annotation.title = "東京駅"
        annotation.subtitle = "Tokyo Station"
        
        self.mapOutlet.addAnnotation(annotation)
    }
    
}
