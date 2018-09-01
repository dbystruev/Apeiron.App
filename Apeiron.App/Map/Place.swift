//
//  places.swift
//  Apeiron.App
//
//  Created by Denis Bystruev on 01/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import CoreLocation

/// Place for the map — with action, address, description, and location
struct Place {
    let action: Action
    let address: String
    let description: String
    let location: CLLocationCoordinate2D
}

/// Places which should be pinned on the map
let places: [Place] = [
    Place(
        action: .none,
        address: "Бауманская улица, 40",
        description: "Дом, где родился А. С. Пушкин",
        location: CLLocationCoordinate2D(latitude: 55.770811, longitude: 37.677652)
    ),
    Place(
        action: .none,
        address: "Большой Харитоньевский переулок, 21с1",
        description: "Семья Пушкиных жила здесь в 1802–1803 гг.",
        location: CLLocationCoordinate2D(latitude: 55.766557, longitude: 37.648762)
    ),
    Place(
        action: .none,
        address: "Спартаковская улица, 15",
        description: "Собор Богоявления Господня в Елохове, где крестили Пушкина",
        location: CLLocationCoordinate2D(latitude: 55.772679, longitude: 37.674993)
    ),
    Place(
        action: .none,
        address: "Большая Никитская улица, 36с1",
        description: "Храм Большое Вознесение, где венчались Пушкин и Гончарова",
        location: CLLocationCoordinate2D(latitude: 55.757718, longitude: 37.595779)
    ),
    Place(
        action: .none,
        address: "улица Арбат, 53с6",
        description: "Дом, где в 1830–31 жил поэт и его молодая жена",
        location: CLLocationCoordinate2D(latitude: 55.747226, longitude: 37.586086)
    )
]

/// GPS coordinates for the pins at the map
let locations = [
    (55.770811, 37.677652),     // Бауманская улица, 40 (дом, где родился Пушкин)
    (55.766557, 37.648762),     // Большой Харитоньевский переулок, 21с1 (жили 1802–1803)
    (55.772679, 37.674993),     // Спартаковская улица, 15 (Собор Богоявления Господня в Елохове)
    (55.757718, 37.595779),     // Большая Никитская улица, 36с1 (Храм Большое Вознесение)
    (55.747226, 37.586086),     // улица Арбат, 53с6 (жили 1830–1831)
]
