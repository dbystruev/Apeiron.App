//
//  ARViewController.swift
//  Apeiron.App
//
//  Created by Denis Bystruev on 02/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import ARKit
import UIKit

class ARViewController: UIViewController {

    /// ARKit Scene View
    @IBOutlet weak var sceneView: ARSCNView!
    
    /// Called when the AR view has been loaded
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the empty scene to the view
        sceneView.scene = SCNScene()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
