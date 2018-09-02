//
//  MoscowPlaces.swift
//  Apeiron.App
//
//  Created by Denis Bystruev on 02/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import CoreLocation

/// Places in Moscow which should be pinned on the map
let moscowPlaces: [Place] = [
    Place(
        action: .performSegue("ARSegue"),
        address: "Бауманская улица, 40",
        coordinate: CLLocationCoordinate2D(latitude: 55.770811, longitude: 37.677652),
        title: "Дом, где родился А. С. Пушкин"
    ),
    Place(
        action: .performSegue("ARSegue"),
        address: "Большой Харитоньевский переулок, 21с1",
        coordinate: CLLocationCoordinate2D(latitude: 55.766557, longitude: 37.648762),
        title: "Семья Пушкиных жила здесь в 1802–1803 гг."
    ),
    Place(
        action: .performSegue("ARSegue"),
        address: "Спартаковская улица, 15",
        coordinate: CLLocationCoordinate2D(latitude: 55.772679, longitude: 37.674993),
        title: "Собор Богоявления Господня в Елохове, где крестили Пушкина"
    ),
    Place(
        action: .performSegue("ARSegue"),
        address: "Большая Никитская улица, 36с1",
        coordinate: CLLocationCoordinate2D(latitude: 55.757718, longitude: 37.595779),
        title: "Храм Большое Вознесение, где венчались Пушкин и Гончарова"
    ),
    Place(
        action: .performSegue("ARSegue"),
        address: "улица Арбат, 53с6",
        coordinate: CLLocationCoordinate2D(latitude: 55.747226, longitude: 37.586086),
        title: "Дом, где в 1830–31 жил поэт и его молодая жена"
    )
]
