//
//  CountryViewController.swift
//  Apeiron.App
//
//  Created by Denis Bystruev on 02/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import MapKit
import UIKit

class CountryViewController: MapViewController {

    /// Country map view
    @IBOutlet weak var countryMapView: MKMapView!
    
    // The main navigation title
    override var navigationTitle: String {
        return "Пушкин в России"
    }
    
    /// Called when the map view has been loaded
    override func viewDidLoad() {
        // assign Russia map view to the parent map view
        mapView = countryMapView
        
        // use country places as the places to show
        places = countryPlaces
        
        // perform parent's viewDidLoad()
        super.viewDidLoad()
        
        // fetch assignments in advance so AR reference images can pre-load
        Assignment.load()
    }
}
