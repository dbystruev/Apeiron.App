//
//  CLLocationCoordinate2D+Equatable.swift
//  Apeiron.App
//
//  Created by Denis Bystruev on 02/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import CoreLocation

// Make CLLocation satisfy Equatable protocol
extension CLLocationCoordinate2D: Equatable {
    // two locations are equal when their latitudes and longitudes are equal
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
