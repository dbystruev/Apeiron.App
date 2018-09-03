//
//  RussiaPlaces.swift
//  Apeiron.App
//
//  Created by Denis Bystruev on 02/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import CoreLocation

/// Cities in Russia which should be pinned on the map
let russiaPlaces: [Place] = [
    Place(
        action: .openURL("https://ilibrary.ru/text/483/index.html"),
        address: "Эрзурум, Турция",
        coordinate: CLLocationCoordinate2D(latitude: 39.900293, longitude: 41.265891),
        title: "Арзрум"
    ),
    Place(
        action: .openURL("http://www.boldinomuzey.ru"),
        address: "Большеболдинский район, Нижегородская область",
        coordinate: CLLocationCoordinate2D(latitude: 55.002620, longitude: 45.311373),
        title: "Болдино"
    ),
    Place(
        action: .openURL("https://www.tripadvisor.ru/Attraction_Review-g1104731-d8776540-Reviews-Statue_of_Pushkin-Vladikavkaz_Republic_of_North_Ossetia_Alania_North_Caucasian_D.html"),
        address: "Северная Осетия — Алания, Россия",
        coordinate: CLLocationCoordinate2D(latitude: 43.021064, longitude: 44.681897),
        title: "Владикавказ"
    ),
    Place(
        action: .openURL("http://gurzufmuseum.com"),
        address: "Ялта, Крым",
        coordinate: CLLocationCoordinate2D(latitude: 44.547382, longitude: 34.291515),
        title: "Гурзуф"
    ),
    Place(
        action: .openURL("https://9musesjournal.wordpress.com/2014/06/06/людмила-чекашина-пушкин-в-екатеринос/"),
        address: "Днепр, Украина",
        coordinate: CLLocationCoordinate2D(latitude: 48.464717, longitude: 35.046181),
        title: "Екатеринослав"
    ),
    Place(
        action: .openURL("http://izmail.es/article/9633/"),
        address: "Одесская область, Украина",
        coordinate: CLLocationCoordinate2D(latitude: 45.350981, longitude: 28.836145),
        title: "Измаил"
    ),
    Place(
        action: .openURL("http://kmvline.ru/kislovodsk/mk_1.php"),
        address: "Ставропольский край",
        coordinate: CLLocationCoordinate2D(latitude: 43.905225, longitude: 42.716796),
        title: "Кисловодск"
    ),
    Place(
        action: .openURL("http://pushkin-moldova.narod.ru/kishinev.html"),
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
        action: .performSegue("MoscowSegue"),
        address: "Россия",
        coordinate: CLLocationCoordinate2D(latitude: 55.753215, longitude: 37.622504),
        title: "Москва"
    ),
    Place(
        action: .openURL("https://ru.wikipedia.org/wiki/Музей_Пушкина_в_Одессе"),
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
        action: .openURL("http://pzapovednik.ru"),
        address: "Дзержинский район, Калужская область, Россия",
        coordinate: CLLocationCoordinate2D(latitude: 54.742200, longitude: 35.998072),
        title: "Полотняный завод"
    ),
    Place(
        action: .openURL("http://bibliopskov.ru/html2/p_body.html"),
        address: "Россия",
        coordinate: CLLocationCoordinate2D(latitude: 57.816915, longitude: 28.334625),
        title: "Псков"
    ),
    Place(
        action: .openURL("http://www.pushkinmuseum.ru"),
        address: "Россия",
        coordinate: CLLocationCoordinate2D(latitude: 59.939095, longitude: 30.315868),
        title: "Санкт-Петербург"
    ),
    Place(
        action: .openURL("https://sputnik-georgia.ru/columnists/20160608/232048177.html"),
        address: "Тбилиси, Грузия",
        coordinate: CLLocationCoordinate2D(latitude: 41.697048, longitude: 44.799307),
        title: "Тифлис"
    ),
    Place(
        action: .openURL("http://turbina.ru/guide/Uralsk-Kazakhstan-102590/Zametki/Pushkin-v-Uralske-94919/"),
        address: "Казахстан",
        coordinate: CLLocationCoordinate2D(latitude: 51.203980, longitude: 51.370375),
        title: "Уральск"
    ),
    Place(
        action: .openURL("https://ru.wikipedia.org/wiki/Императорский_Царскосельский_лицей"),
        address: "Пушкин, Санкт-Петербург, Россия",
        coordinate: CLLocationCoordinate2D(latitude: 59.7183, longitude: 30.416),
        title: "Царское село"
    ),
]
