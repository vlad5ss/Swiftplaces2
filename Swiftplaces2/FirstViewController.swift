//
//  FirstViewController.swift
//  Swiftplaces2
//
//  Created by mac on 4/26/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MapKit
import CoreLocation

class FirstViewController: UIViewController, DataProtocol, CLLocationManagerDelegate  {
    
//    var listToilets:[Toilets]? = []
      var listPlaces:[Places]? = []
//    let data = DataToilets()
      let data = DataPlaces()
    @IBOutlet var mapView: MKMapView!
   let locatonManager = CLLocationManager()
    
    
    @IBAction func enabledChanged(sender: UISwitch) {
        
        if sender.isOn {
            
            // Start Updating current location
            locatonManager.startUpdatingLocation()
            print("switch on")
            
        } else {
            // Stop Updating current location
            locatonManager.stopUpdatingLocation()
            print("switch of")
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.askForDataWith(self)
        //1
//        locatonManager.delegate = self
//        
//        // Best location
//        locatonManager.desiredAccuracy = kCLLocationAccuracyBest
//        
//        // Request to use Localization , info.plist - add line - WAZNE
//        locatonManager.requestWhenInUseAuthorization()
//        
//        // Start Updating current location
//        // self.locatonManager.startUpdatingLocation()
//        
//        // Show BLUE  dotpin
//        mapView.showsUserLocation = true
////        locationManager.startUpdatingLocation()


        let initialLocation = CLLocation(latitude: 34.049993, longitude: -118.246038)
        let regionRadius: CLLocationDistance = 500000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                      regionRadius * 2.0, regionRadius * 2.0)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        
        centerMapOnLocation(location: initialLocation)
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didRetrieveData(_ places: [Places]) {
        self.mapView.addAnnotations(places)
    }
    

    
    
    // MARK: - Location Delegate Methods
    
//    func locationManager(_ locationManager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        locationManager.stopUpdatingLocation()
//        // last location
//        let location = locations.last
//        
//        // Center to current Location
//        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
//        
//        // Zoom to region with Center,  (5,5)-ZOOM value
//        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.09, longitudeDelta: 0.09))
//        
//        // set Region to Show with Animaction Zooming
//        self.mapView.setRegion(region, animated: true)
//        
////        self.mapView.addAnnotations("My Place")
//    }
    
//       
//    func locationManager(_ manager: CLLocationManager,
//                         didFailWithError error: Error) {
//        let errorType = error._code == CLError.denied.rawValue
//            ? "Access Denied": "Error \(error._code)"
//        let alertController = UIAlertController(title: "Location Manager Error",
//                                                message: errorType, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .cancel,
//                                     handler: { action in })
//        alertController.addAction(okAction)
//        present(alertController, animated: true,
//                completion: nil)
//    }
    
    
  }






