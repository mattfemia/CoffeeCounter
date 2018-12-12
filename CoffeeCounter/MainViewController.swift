//
//  MainViewController.swift
//  CoffeeCounter
//
//  Created by Matthew Femia on 12/8/18.
//  Copyright © 2018 Matthew Femia. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import CoreLocation
import MapKit

class MainViewController: UIViewController, CLLocationManagerDelegate {
    
    // Representing the map itself on the MainViewController
    @IBOutlet weak var mapView: MKMapView!
    
    // Assign the location manager to a constant to be used
    let locationManager: CLLocationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.showsUserLocation = true
        
        if
            CLLocationManager.locationServicesEnabled() == true {
                if CLLocationManager.authorizationStatus() == .restricted ||
                    CLLocationManager.authorizationStatus() == .denied ||
                    CLLocationManager.authorizationStatus() == .notDetermined {
                    
                    // Requests location services be used when the app is in use
                    locationManager.requestWhenInUseAuthorization()
            }
            
            // Used to represent location accuracy level in meters (Read docs)
            locationManager.desiredAccuracy = 1.0
            locationManager.delegate = self
            
            // Location manager will give us updates about location
            locationManager.startUpdatingLocation()
            locationManager.distanceFilter = 5
            
        } else {
            print("Please turn on location services")
        }
    }
    
    // CLLocationManager Delegates
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        self.mapView.setRegion(currRegion, animated: true)
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Current location could not be accessed")
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        }
    
    // Make a counter
        // TODO
    
    // Adjust counter to the amount of coffees the user has -- read and write to the Firebase Database
        // TODO
    
    @IBAction func onSignOutClick(_ sender: Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
        
        performSegue(withIdentifier: "mainToInitial", sender: self)
    }
    /* MAKE USER PROFILE */
        // Ranking for how many coffees per day? week? ever?
        // Ability to add friends
        // Capability of sending friends your free coffee with message attached
 
}
