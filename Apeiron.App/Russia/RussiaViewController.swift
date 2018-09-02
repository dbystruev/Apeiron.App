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
        // assign Moscow map view to parent map view
        mapView = russiaMapView
        
        // use Moscow places fpr places
        places = russiaPlaces
        
        // perform parent's viewDidLoad()
        super.viewDidLoad()
    }
}
