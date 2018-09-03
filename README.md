# Apeiron.App
Apeiron App made as part of Moscow Teacher Hackaton on Sep 1–2, 2018 (http://eduhackathon.ru)

You need to use Xcode 10 to compile.  There are 3 screens currently.  More can be added.

## The first two screens are the map views

Pushkin in Russia

![Pushkin in Russia](https://github.com/dbystruev/Apeiron.App/blob/master/Apeiron.App/Common/Assets.xcassets/Screnshots/Pushkin%20in%20Russia.imageset/Pushkin%20in%20Russia.png?raw=true)

Pushkin in Moscow

![Pushkin in Moscow](https://github.com/dbystruev/Apeiron.App/blob/master/Apeiron.App/Common/Assets.xcassets/Screnshots/Pushkin%20in%20Moscow.imageset/Pushkin%20in%20Moscow.png?raw=true)

What is displayed there is defined by `places: [Place]` property of their view controllers:

- `RussiaViewController` defined in [/Screens/Russia/RussiaViewController.swift](https://github.com/dbystruev/Apeiron.App/blob/master/Apeiron.App/Screens/Russia/RussiaViewController.swift)
- `MoscowViewController` defined in [/Screens/Moscow/MoscowViewController.swift](https://github.com/dbystruev/Apeiron.App/blob/master/Apeiron.App/Screens/Moscow/MoscowViewController.swift)

which are descendats of `MapViewController` defined in [Common/MapViewController.swift](https://github.com/dbystruev/Apeiron.App/blob/master/Apeiron.App/Common/MapViewController.swift).

The `places` property assigned the content of `russiaPlaces` and `moscowPlaces`, which are defined in:

- `russiaPlaces` in [/Screens/Russia/RussiaPlaces.swift](https://github.com/dbystruev/Apeiron.App/blob/master/Apeiron.App/Screens/Russia/RussiaPlaces.swift)
- `moscowPlaces` in [/Screens/Moscow/MoscowPlaces.swift](https://github.com/dbystruev/Apeiron.App/blob/master/Apeiron.App/Screens/Moscow/MoscowPlaces.swift)

`Place` is defined in [Common/Place.swift](https://github.com/dbystruev/Apeiron.App/blob/master/Apeiron.App/Common/Place.swift).

One of Place's properties is `action: Action`, which determines the actions to be performed when a pin on the map is tapped.

`Action` enum is defined in [Common/Action.swift](https://github.com/dbystruev/Apeiron.App/blob/master/Apeiron.App/Common/Action.swift) and can be one of the following:
- none
- openURL(String)
- performSegue(String)

In case of `openURL` the String is URL to open — e. g. "[http://www.boldinomuzey.ru](http://www.boldinomuzey.ru)" or "instagram://".

In case of `performSegue` the String is the segue’s [identifier](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621413-performsegue) defined in Xcode Interface Builder for each segue.

Excerpt from `russiaPlaces: [Place]` defined in [/Screens/Russia/RussiaPlaces.swift](https://github.com/dbystruev/Apeiron.App/blob/master/Apeiron.App/Screens/Russia/RussiaPlaces.swift) with all three cases:

```
let russiaPlaces: [Place] = [
    Place(
        action: .openURL("http://www.boldinomuzey.ru"),
        address: "Bolsheboldinsky raion, Nizhegorodskaya oblast, Russia",
        coordinate: CLLocationCoordinate2D(latitude: 55.002620, longitude: 45.311373),
        title: "Boldino"
    ),
    Place(
        action: .none,
        address: "Stavropol Krai, Russia",
        coordinate: CLLocationCoordinate2D(latitude: 43.905225, longitude: 42.716796),
        title: "Kislovodsk"
    ),
    Place(
        action: .performSegue("MoscowSegue"),
        address: "Russia",
        coordinate: CLLocationCoordinate2D(latitude: 55.753215, longitude: 37.622504),
        title: "Moscow"
    )
]
```

## The third screen is an AR Quiz

Questions and answers to that quiz are determined in `assignments: TrackedArray<Assignment>` defined in [/Screens/AR/Assignment.swift](https://github.com/dbystruev/Apeiron.App/blob/master/Apeiron.App/Screens/AR/Assignment.swift).

Example of such definition:

```
let assignments = TrackedArray(
    Assignment(
        imageName: "Ruslan and Ludmila",
        question: """
            Where are those lines from?
            
            «Of times that gone the fable stories,
            In leisure’s golden hours, few,»
        """,
        answer: """
             The poem «Ruslan and Ludmila» (1820)
        """
    )
)
```

A student is given 30 seconds to answer.  In order to answer they have to find an object which is determined by the question — e. g. a book's title, some page within the book, a portrait of someone etc.  The pictures of those objects have to be loaded into [/Common/Assets.xcassets/AR%20Resources.arresourcegroup](https://github.com/dbystruev/Apeiron.App/tree/master/Apeiron.App/Common/Assets.xcassets/AR%20Resources.arresourcegroup) folder the usual way via Xcode.

The name of each AR reference image should be set in Xcode attribute inspector and it should match `imageName` property of `assignmets` element.

Currently only the first question is displayed, but you can change code in [/Screens/AR/ARViewController.swift](https://github.com/dbystruev/Apeiron.App/blob/master/Apeiron.App/Screens/AR/ARViewController.swift) to display a random question until all questions are exausted.

The screen with countdown timer:

![AR Quiz](https://github.com/dbystruev/Apeiron.App/blob/master/Apeiron.App/Common/Assets.xcassets/Screnshots/AR%20Quiz.imageset/AR%20Quiz.png?raw=true)

We lose if we didn't find the answer:

![AR Quiz Wrong](https://github.com/dbystruev/Apeiron.App/blob/master/Apeiron.App/Common/Assets.xcassets/Screnshots/AR%20Quiz%20Wrong.imageset/AR%20Quiz%20Wrong.png?raw=true)

We win if we did find the object asked for in the question:

![AR Quiz Correct](https://github.com/dbystruev/Apeiron.App/blob/master/Apeiron.App/Common/Assets.xcassets/Screnshots/AR%20Quiz%20Correct.imageset/AR%20Quiz%20Correct.png?raw=true).

## Apeiron team

See [Apeiron.app](https://apeiron.app).
