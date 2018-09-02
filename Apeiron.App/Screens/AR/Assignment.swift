//
//  Assignment.swift
//  Apeiron.App
//
//  Created by Denis Bystruev on 02/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import ARKit

/// Assignment to match a text with the image
struct Assignment {
    let image: ARReferenceImage
    let question: String
    let answer: String
    
    /// Set to store all reference images
    static var referenceImages: Set<ARReferenceImage>!
    
    /// Initialize image with image name
    ///
    /// - Parameters:
    ///   - imageName: the name of the image to search for in reference images
    ///   - text: text for the task to match the image
    init?(imageName: String, question: String, answer: String) {
        // check if we need to load reference images
        if Assignment.referenceImages == nil {
            // get the images for recognition from AR Resources
            guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
                print("\(#function): can't find images in group AR Resources")
                return nil
            }
            
            // store reference images in type var
            Assignment.referenceImages = referenceImages
        }
        
        // search for the image with given name
        for referenceImage in Assignment.referenceImages {
            // check if reference image has a name
            if let name = referenceImage.name {
                // check if that name is the one we are looking for
                if name == imageName {
                    // found — assign properties and return
                    self.image = referenceImage
                    self.question = question
                    self.answer = answer
                    return
                }
            }
        }
        
        // no image found — return nil
        return nil
    }
}

let assignments = TrackedArray(
    Assignment(
        imageName: "Руслан и Людмила",
        question: """

            Откуда эти строки?

            «Дела давно минувших дней,
            Преданья старины глубокой.»

        """,
        answer: """

             Это поэма «Руслан и Людмила» (1820)

        """
    )
)
