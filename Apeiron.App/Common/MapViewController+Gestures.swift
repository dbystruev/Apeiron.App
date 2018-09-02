//
//  MapViewController+Gestures.swift
//  Apeiron.App
//
//  Created by Denis Bystruev on 03/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import UIKit

// MARK: - Gestures for MapViewController
extension MapViewController {
    
    /// Called when user moved the finger up
    ///
    /// - Parameters:
    ///   - touches: actual touches (not used)
    ///   - event: the event where the touches belong (not used)
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
            action.perform(sender: self)
            
            // after the return show all pins
            showAllPins()
        } else {
            // next touch would be the second touch
            secondTouch = true
        }
    }
}
