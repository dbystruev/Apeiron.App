//
//  MapViewController.swift
//  Apeiron.App
//
//  Created by Denis Bystruev on 02/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import MapKit
import UIKit

class MapViewController: UIViewController {
    
    /// Places in the map which should be pinned to the map
    var places: [Place]!

    /// Map view
    weak var mapView: MKMapView!
    
    // The main navigation title
    var navigationTitle: String {
        // should not be used directly — it is overriden in children view controllers
        return "Default"
    }
    
    /// True when already selected annotation (pin) is touched again
    var secondTouch = false
    
    /// Called when the map view has been loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set initial view of the screen with pins
        setupMapView()
    }
    
    /// Set initial view of the screen with pins
    func setupMapView() {
        // set ourselves as MKMapViewDelegate
        mapView.delegate = self
        
        // allow user to scroll
        mapView.isScrollEnabled = true
        
        // allow user to zoom
        mapView.isZoomEnabled = true
        
        // set map type to hybrid (satellite images with labels)
        mapView.mapType = .hybrid
        
        // center and zoom the map so that all pins are visible
        showAllPins()
        
        // place the pins
        for place in places {
            setPin(place)
        }
    }
    
    /// Center and zoom the map so that all pins are visible
    func showAllPins() {
        // update the label
        navigationItem.title = navigationTitle
        
        // make all pins deselected
        for annotation in mapView.selectedAnnotations {
            mapView.deselectAnnotation(annotation, animated: true)
        }
        
        // no pin is selected — do not expect second touch yet
        secondTouch = false
        
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
        
        // find out the deltas of the span and use the highest one
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
        
        // set the region to cover all the points
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    /// Creates a pin on the map at the given place
    ///
    /// - Parameter place: a place where to put pin on
    func setPin(_ place: Place) {
        // create a new pin
        let pin = PointAnnotation(place: place)
        
        // set pin's coordinate, title, and subtitle as address
        pin.coordinate = place.coordinate
        pin.subtitle = place.address
        pin.title = place.title
        
        // add the pin to the map
        mapView.addAnnotation(pin)
    }
}
