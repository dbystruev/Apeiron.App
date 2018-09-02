//
//  cities.swift
//  Apeiron.App
//
//  Created by Denis Bystruev on 02/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import CoreLocation

/// Cities in Russia which should be pinned on the map
let russiaPlaces: [Place] = [
    Place(
        action: .none,
        address: "Эрзурум, Турция",
        coordinate: CLLocationCoordinate2D(latitude: 39.900293, longitude: 41.265891),
        title: "Арзрум"
    ),
    Place(
        action: .openURL("http://www.boldinomuzey.ru"),
        address: "Большеболдинский район, Нижегородская область, Россия",
        coordinate: CLLocationCoordinate2D(latitude: 55.002620, longitude: 45.311373),
        title: "Болдино"
    ),
    Place(
        action: .none,
        address: "Северная Осетия — Алания, Россия",
        coordinate: CLLocationCoordinate2D(latitude: 43.021064, longitude: 44.681897),
        title: "Владикавказ"
    ),
    Place(
        action: .none,
        address: "Ялта, Крым, Россия",
        coordinate: CLLocationCoordinate2D(latitude: 44.547382, longitude: 34.291515),
        title: "Гурзуф"
    ),
    Place(
        action: .none,
        address: "Днепр, Украина",
        coordinate: CLLocationCoordinate2D(latitude: 48.464717, longitude: 35.046181),
        title: "Екатеринослав"
    ),
    Place(
        action: .none,
        address: "Одесская область, Украина",
        coordinate: CLLocationCoordinate2D(latitude: 45.350981, longitude: 28.836145),
        title: "Измаил"
    ),
    Place(
        action: .none,
        address: "Ставропольский край, Россия",
        coordinate: CLLocationCoordinate2D(latitude: 43.905225, longitude: 42.716796),
        title: "Кисловодск"
    ),
    Place(
        action: .none,
        address: "Молдова",
        coordinate: CLLocationCoordinate2D(latitude: 47.024672, longitude: 28.832336),
        title: "Кишенев"
    ),
    Place(
        action: .openURL("http://pushkin.ellink.ru"),
        address: "Пушкинские Горы, Пушкиногорский район, Псковская область, Россия",
        coordinate: CLLocationCoordinate2D(latitude: 57.060088, longitude: 28.933298),
        title: "Михайловское"
    ),
    Place(
        action: .none,
        address: "Россия",
        coordinate: CLLocationCoordinate2D(latitude: 55.753215, longitude: 37.622504),
        title: "Москва"
    ),
    Place(
        action: .none,
        address: "Украина",
        coordinate: CLLocationCoordinate2D(latitude: 46.484585, longitude: 30.732641),
        title: "Одесса"
    ),
    Place(
        action: .openURL("http://www.mio56.ru"),
        address: "Россия",
        coordinate: CLLocationCoordinate2D(latitude: 51.768199, longitude: 55.096955),
        title: "Оренбург"
    ),
        Place(
        action: .none,
        address: "Дзержинский район, Калужская область, Россия",
        coordinate: CLLocationCoordinate2D(latitude: 54.742200, longitude: 35.998072),
        title: "Полотняный завод"
    ),
    Place(
        action: .none,
        address: "Россия",
        coordinate: CLLocationCoordinate2D(latitude: 57.816915, longitude: 28.334625),
        title: "Псков"
    ),
    Place(
        action: .none,
        address: "Россия",
        coordinate: CLLocationCoordinate2D(latitude: 59.939095, longitude: 30.315868),
        title: "Санкт-Петербург"
    ),
    Place(
        action: .none,
        address: "Тбилиси, Грузия",
        coordinate: CLLocationCoordinate2D(latitude: 41.697048, longitude: 44.799307),
        title: "Тифлис"
    ),
    Place(
        action: .none,
        address: "Казахстан",
        coordinate: CLLocationCoordinate2D(latitude: 51.203980, longitude: 51.370375),
        title: "Уральск"
    ),
    Place(
        action: .none,
        address: "Пушкин, Санкт-Петербург, Россия",
        coordinate: CLLocationCoordinate2D(latitude: 59.7183, longitude: 30.416),
        title: "Царское село"
    ),
]
