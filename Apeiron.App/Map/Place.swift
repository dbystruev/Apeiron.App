//
//  places.swift
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

/// Places which should be pinned on the map
let places: [Place] = [
    Place(
        action: .none,
        address: "Бауманская улица, 40",
        coordinate: CLLocationCoordinate2D(latitude: 55.770811, longitude: 37.677652),
        title: "Дом, где родился А. С. Пушкин"
    ),
    Place(
        action: .none,
        address: "Большой Харитоньевский переулок, 21с1",
        coordinate: CLLocationCoordinate2D(latitude: 55.766557, longitude: 37.648762),
        title: "Семья Пушкиных жила здесь в 1802–1803 гг."
    ),
    Place(
        action: .none,
        address: "Спартаковская улица, 15",
        coordinate: CLLocationCoordinate2D(latitude: 55.772679, longitude: 37.674993),
        title: "Собор Богоявления Господня в Елохове, где крестили Пушкина"
    ),
    Place(
        action: .none,
        address: "Большая Никитская улица, 36с1",
        coordinate: CLLocationCoordinate2D(latitude: 55.757718, longitude: 37.595779),
        title: "Храм Большое Вознесение, где венчались Пушкин и Гончарова"
    ),
    Place(
        action: .none,
        address: "улица Арбат, 53с6",
        coordinate: CLLocationCoordinate2D(latitude: 55.747226, longitude: 37.586086),
        title: "Дом, где в 1830–31 жил поэт и его молодая жена"
    )
]
