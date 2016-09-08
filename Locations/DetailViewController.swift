//
//  DetailViewController.swift
//  Locations
//
//  Created by Saurabh Sikka on 08/09/16.
//  Copyright (c) 2016 Saurabh Sikka. All rights reserved.
//

import Foundation
import UIKit
import MapKit


class DetailViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var selectedLocation: LocationModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func viewDidAppear(animated: Bool) {
        // Create coordinates from location lat/long
        var poiCoordinates: CLLocationCoordinate2D = CLLocationCoordinate2D()
        var latConverted = (self.selectedLocation!.latitude! as NSString).doubleValue
        var longConverted = (self.selectedLocation!.longitude! as NSString).doubleValue
        
        poiCoordinates.latitude = latConverted
        poiCoordinates.longitude = longConverted
        
        
        // Zoom to region
        let viewRegion: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(poiCoordinates, 750, 750)
        self.mapView.setRegion(viewRegion, animated: true)
        // Plot pin
        let pin: MKPointAnnotation = MKPointAnnotation()
        pin.coordinate = poiCoordinates
        self.mapView.addAnnotation(pin)
        
        //add title to the pin
        pin.title = selectedLocation!.name
    }
    
}
