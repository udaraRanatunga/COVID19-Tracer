//
//  HomeViewController.swift
//  COVID19-Tracer
//
//  Created by Udara Ranatunga on 9/15/20.
//  Copyright © 2020 Udara Ranatunga. All rights reserved.
//

import UIKit
import MapKit
class HomeViewController: UIViewController, MKMapViewDelegate {
    let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.popToRootViewController(animated: true)        // Do any additional setup after loading the view.
        checkLocationServices()
        
    }

   func checkLocationServices() {
      if CLLocationManager.locationServicesEnabled() {
        checkLocationAuthorization()
      } else {
        // Show alert letting the user know they have to turn this on.
      }
    }
    func checkLocationAuthorization() {
      mapView.delegate = self
      switch CLLocationManager.authorizationStatus() {
      case .authorizedWhenInUse:
        mapView.showsUserLocation = true
       case .denied: // Show alert telling users how to turn on permissions
       break
      case .notDetermined:
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
      case .restricted: // Show an alert letting them know what’s up
       break
      case .authorizedAlways:
       break
      }
    }
    
}

