//
//  ARViewController+ARSCNViewDelegate.swift
//  Apeiron.App
//
//  Created by Denis Bystruev on 02/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import ARKit

extension ARViewController: ARSCNViewDelegate {
    // MARK: - ARSCNViewDelegate
    
    /// Called when an image is detected
    ///
    /// - Parameters:
    ///   - renderer: scene renderer
    ///   - node: node which was added
    ///   - anchor: anchor which was detected
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        // make sure detected anchor is indeed image
        guard let imageAnchor = anchor as? ARImageAnchor else { return }
        
        // check if we found the image we are looking for
        won = imageAnchor.referenceImage == assignments.current.image
    }
}
