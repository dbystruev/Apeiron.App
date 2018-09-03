//
//  Action.swift
//  Apeiron.App
//
//  Created by Denis Bystruev on 01/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import UIKit

/// Action to perform when annotation pin is tapped on the map view
///
/// — none: no action
/// - openURL: open an URL with open(_:options:completionHandler:)
/// - performSegue: perform a segue with performSegue(withIdentifier:sender:)
enum Action {
    case none
    case openURL(String)
    case performSegue(String)
    
    /// Performs an action determined by self
    func perform(sender: UIViewController) {
        // check which action to perform
        switch self {
        case .none:
            // no action to perform
            break
        case .openURL(let scheme):
            // a url we will convert the scheme into
            var url: URL
            
            // check that we can create the URL from the scheme ("scheme://")
            if let urlNonEncoded = URL(string: scheme) {
                url = urlNonEncoded
            // now try with percent encoding
            } else if let schemeEncoded = scheme.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
                let urlEncoded = URL(string: schemeEncoded) {
                url = urlEncoded
            } else {
                print("\(#function): can't convert a \(scheme) to URL")
                break
            }
            
            // check that there is an application installed
            guard UIApplication.shared.canOpenURL(url) else {
                print("\(#function): an app to open a \(scheme) is not installed")
                break
            }
            
            // open the URL
            UIApplication.shared.open(url) { success in
                if !success {
                    print("\(#function): could not open a \(scheme)")
                }
            }
        case .performSegue(let identifier):
            // perform a segue with given identifier
            sender.performSegue(withIdentifier: identifier, sender: sender)
        }
    }
}
