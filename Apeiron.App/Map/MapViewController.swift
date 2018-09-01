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
        // allow user to scroll
        mapView.isScrollEnabled = true

        // allow user to zoom
        mapView.isZoomEnabled = true
        
        // set standard map type
        mapView.mapType = .standard
        
        // to find South West and North East coordinates start with the first element
        var southWest = places.first!.coordinate
        var northEast = southWest
        
        // go through all the places to find the South West and North East points
        for place in places {
            // get the geo coordinate of the place
            let coordinate = place.coordinate
            
            // search for min latitude and longitude to get the South West coordinate
            southWest.latitude = min(southWest.latitude, coordinate.latitude)
            southWest.longitude = min(southWest.longitude, coordinate.longitude)
            
            // search for max latitude and longitude to the the North East coordinate
            northEast.latitude = max(northEast.latitude, coordinate.latitude)
            northEast.longitude = max(northEast.longitude, coordinate.longitude)
        }
        
        // find out the deltas for the span and use the highest one
        let latitudeDelta = abs(southWest.latitude - northEast.latitude)
        let longitudeDelta = abs(southWest.longitude - northEast.longitude)
        let maxDelta = 2 * max(latitudeDelta, longitudeDelta)
        
        // find out the center of the map
        let center = CLLocationCoordinate2D(
            latitude: (southWest.latitude + northEast.latitude) / 2,
            longitude: (southWest.longitude + northEast.longitude) / 2
        )
        
        // set the span area
        let span = MKCoordinateSpan(latitudeDelta: maxDelta, longitudeDelta: maxDelta)
        
        // set the region
        mapView.region = MKCoordinateRegion(center: center, span: span)
        
        // set the pins
        for place in places {
            setPin(place)
        }
    }

    /// Creates a pin on the map at the given place
    ///
    /// - Parameter place: a place where to put pin on
    func setPin(_ place: Place) {
        // create a point annotation
        let pin = PointAnnotation(place: place)
        
        // set annotation's coordinate and title
        pin.coordinate = place.coordinate
        pin.subtitle = place.address
        pin.title = place.title
        
        // add annotation to map
        mapView.addAnnotation(pin)
    }
}
