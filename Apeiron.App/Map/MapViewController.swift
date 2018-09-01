//
//  ViewController.swift
//  Apeiron.App
//
//  Created by Denis Bystruev on 01/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import MapKit
import UIKit

class MapViewController: UIViewController {
    
    /// Map view presenting the main screen
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set initial view of the screen with pins
        setupMapView()
    }
    
    /// Set initial view of the screen with pins
    func setupMapView() {
        
        /// Performs operation (e. g. min or max) on tuple with two double elements
        ///
        /// - Parameters:
        ///   - left: first tuple
        ///   - right: second tuple
        ///   - operation: operation to perform (e. g. min or max)
        /// - Returns: a tuple each element of which is the result of operation
        func operate(
            _ left: (Double, Double),
            _ right: (Double, Double),
            operation: (Double, Double) -> Double
        ) -> (Double, Double) {
            return (operation(left.0, right.0), operation(left.1, right.1))
        }
        
        // find bottom left and top right coordinates — start with first element
        var bottomLeft = places.first!
        var topRight = bottomLeft
        
        // go through all places and find bottom left and top right boundaries
        for place in places {
            bottomLeft = operate(bottomLeft, place, operation: min)
            topRight = operate(topRight, place, operation: max)
        }
        
        // find out the center of the map
        let center = operate(bottomLeft, topRight, operation: { ($0 + $1) / 2 })
        let centerLocation = CLLocationCoordinate2D(latitude: center.0, longitude: center.1)
        
        // find out the maximum delta between the objects on map
        var delta = operate(bottomLeft, topRight, operation: { 1.5 * abs($0 - $1) })
        delta.0 = max(delta.0, delta.1)
        delta.1 = delta.0
        
        // allow user to zoom
        mapView.isZoomEnabled = true
        
        // allow user to scroll
        mapView.isScrollEnabled = true
        
        // setup standard map type
        mapView.mapType = .standard
        
        // set the span area
        let span = MKCoordinateSpan(latitudeDelta: delta.0, longitudeDelta: delta.1)
        
        // set the region
        let region = MKCoordinateRegion(center: centerLocation, span: span)
        mapView.region = region
        
        // set the pins
        for place in places {
            setPin(place)
        }
    }

    /// Creates a pin on the map at coordinate
    ///
    /// - Parameter coordinate: place where to put pin on
    func setPin(_ coordinate: (Double, Double)) {
        // create a point annotation
        let pin = MKPointAnnotation()
        
        // set annotation's coordinate
        pin.coordinate = CLLocationCoordinate2D(latitude: coordinate.0, longitude: coordinate.1)
        
        // add annotation to map
        mapView.addAnnotation(pin)
    }
}

