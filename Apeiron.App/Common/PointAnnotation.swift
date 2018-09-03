//
//  PointAnnotation.swift
//  Apeiron.App
//
//  Created by Denis Bystruev on 02/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import MapKit

/// Standard MKPointAnnotation with an extra property — place
class PointAnnotation: MKPointAnnotation {
    /// A place this point annotates
    var place: Place
    
    /// Initialize with the given Place
    ///
    /// - Parameter place: the Place which needs to be annotated
    init(place: Place) {
        self.place = place
        super.init()
    }
}
