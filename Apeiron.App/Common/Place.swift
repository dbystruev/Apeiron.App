//
//  Place.swift
//  Apeiron.App
//
//  Created by Denis Bystruev on 01/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import CoreLocation

/// Place for the map — with action, address, geo coordinate, and description
struct Place {
    let action: Action
    let address: String
    let coordinate: CLLocationCoordinate2D
    let title: String
}
