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
    
    /// Label to display the assignment question and answer
    @IBOutlet weak var topLabel: UILabel!
    
    /// Label to display the counter
    @IBOutlet weak var middleLabel: UILabel!
    
    /// Timer to countdown the time remaining
    var timer: Timer!
    var timerValue = 30 {
        didSet {
            // update the label every time timer value has updated
            DispatchQueue.main.async {
                self.middleLabel.text = "\(self.timerValue)"
            }
        }
    }
    
    /// True when the player wins
    var won = false
    
    /// Called when the AR view has been loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self

        // Load the empty scene to the view
        sceneView.scene = SCNScene()
        
        // Show the first assignment
        topLabel.text = assignments.current.question
        topLabel.numberOfLines = 0
    }
    
    /// Called when AR view is going to be shown
    ///
    /// - Parameter animated: whether to animate the appearance
    override func viewWillAppear(_ animated: Bool) {
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Allow images detection
        configuration.detectionImages = Assignment.referenceImages
        
        // Run the view's session
        sceneView.session.run(configuration)
        
        // Start the timer countdown
        startTimer()
    }
    
    
    
    /// Called when AR view is going to disappear
    ///
    /// - Parameter animated: whether to animate the disappearance
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}
