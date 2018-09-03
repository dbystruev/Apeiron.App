//
//  RussiaViewController.swift
//  Apeiron.App
//
//  Created by Denis Bystruev on 02/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import MapKit
import UIKit

class RussiaViewController: MapViewController {

    /// Russia map view
    @IBOutlet weak var russiaMapView: MKMapView!
    
    // The main navigation title
    override var navigationTitle: String {
        return "Пушкин в России"
    }
    
    /// Called when the map view has been loaded
    override func viewDidLoad() {
        // assign Russia map view to the parent map view
        mapView = russiaMapView
        
        // use Russia places as the places to show
        places = russiaPlaces
        
        // perform parent's viewDidLoad()
        super.viewDidLoad()
        
        // fetch assignments in advance so AR reference images can pre-load
        Assignment.load()
    }
}
