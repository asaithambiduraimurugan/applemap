//
//  ViewController.swift
//  applemap
//
//  Created by Greens-Apple2 on 15/02/23.
//  Copyright © 2023 Greens.com. All rights reserved.
//

import UIKit
import  MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
    @IBOutlet weak var locationtextfield: UITextField!
    @IBOutlet weak var mapview: MKMapView!
    @IBOutlet weak var currentlocationbtn: UIButton!
    override func viewDidLoad() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()

    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
    let locValue:CLLocationCoordinate2D = manager.location!.coordinate
    print("locations = \(locValue.latitude) \(locValue.longitude)")
        let location = locations.last! as CLLocation
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapview.setRegion(region, animated: true)
    }
}
