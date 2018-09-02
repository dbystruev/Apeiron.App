//
//  MapViewController+MKMapViewDelegate.swift
//  Apeiron.App
//
//  Created by Denis Bystruev on 03/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import MapKit

// MARK: - MKMapViewDelegate
// Make MapViewController satisfy MKMapViewDelegate protocol
extension MapViewController: MKMapViewDelegate {
    
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
    
    /// Called when the user deselects the pin
    ///
    /// - Parameters:
    ///   - mapView: map view with the pin
    ///   - view: annotation (pin) view deselected
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        // center and zoom the map so that all pins are visible
        showAllPins()
    }
}
