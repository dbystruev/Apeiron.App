//
//  MapViewController.swift
//  Apeiron.App
//
//  Created by Denis Bystruev on 02/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import MapKit
import UIKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var places: [Place]!

    /// Map view
    weak var mapView: MKMapView!
    
    // The main navigation title
    var navigationTitle: String {
        return "Общая карта"
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
        
        // set standard map type
        mapView.mapType = .hybrid
        
        // center and zoom the map so that all pins are visible
        showAllPins()
        
        // set the pins
        for place in places {
            setPin(place)
        }
    }
    
    /// Center and zoom the map so that all pins are visible
    func showAllPins() {
        // update the label
        navigationItem.title = navigationTitle
        
        // no pin is selected, no second touch is possible
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
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
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
    
    // MARK: - MKMapViewDelegate
    
    /// Called when the user selects the pin
    ///
    /// - Parameters:
    ///   - mapView: map view with the pin
    ///   - view: annotation (pin) view tapped
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        // this pin is just selected, next touch is not yet to perform action
        secondTouch = false
        
        // check that tapped pin is a point annotation
        guard let annotation = view.annotation as? PointAnnotation else {
            print("\(#function) can't get the tapped annotation")
            return
        }
        
        // update the label
        navigationItem.title = annotation.place.title
        
        // create the new region with center and span around the tapped pin
        let center = annotation.coordinate
        var span = mapView.region.span
        var delta = min(span.latitudeDelta, span.longitudeDelta)
        
        // go through all the coordinates and calculate the minimum span
        for place in places {
            // get the coordinate of the given place
            let coordinate = place.coordinate
            
            // skip own coordinate
            if coordinate == center {
                continue
            }
            
            // find the minimum span for the latitude and the longitude
            delta = min(delta, abs(coordinate.latitude - center.latitude), abs(coordinate.longitude - center.longitude))
        }
        
        // recalculate the span based on delta
        delta = min(4 * delta, span.latitudeDelta, span.longitudeDelta)
        span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        
        // create the new region centered around selected pin with the next pin on the side
        let region = MKCoordinateRegion(center: center, span: span)
        
        // animate a change of the region
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        // center and zoom the map so that all pins are visible
        showAllPins()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // if this is the second touch — perform action
        if secondTouch {
            // check if we can get an action from the selected annotation
            guard let action = (mapView.selectedAnnotations.first as? PointAnnotation)?.place.action else {
                print("\(#function): can't unwrap action")
                return
            }
            
            // ask the user to wait as the next screen could take a while to load
            navigationItem.title = "Подождите, пожалуйста..."
            
            // perform the action
            action.perform()
            
            // after the return show all pins
            showAllPins()
        } else {
            // next touch would be the second touch
            secondTouch = true
        }
    }
}
