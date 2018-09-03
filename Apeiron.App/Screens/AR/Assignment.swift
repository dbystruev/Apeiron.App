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
    var image: ARReferenceImage?
    let imageName: String
    let question: String
    let answer: String
    
    /// True when reference images are being loaded
    static var loading = false
    
    /// Set to store all reference images
    static var referenceImages: Set<ARReferenceImage>! {
        didSet {
            // clear the loading flag when reference images are loaded
            loading = false
            
            // try to load not previously loaded reference images
            for _ in 1...assignments.count {
                // get the next assignment
                let assignment = assignments.next
                
                // check if an image not loaded
                if assignment.image == nil {
                    // try to load the image
                    assignments.current.image = loadImage(imageName: assignment.imageName)
                }
            }
        }
    }
    
    /// Load referenceImages
    static func load() {
        // check if we need to load reference images
        if referenceImages == nil && !loading {
            // set the loading flag, it will clear when referenceImages are assigned
            loading = true
            
            // load AR reference images in background
            DispatchQueue.global(qos: .background).async {
                // get the images for recognition from AR Resources
                guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
                    print("\(#function): can't find images in group AR Resources")
                    return
                }
                
                // store reference images in type var
                Assignment.referenceImages = referenceImages
            }
        }
    }
    
    /// Searches AR reference images for the image with the given name
    ///
    /// - Parameter imageName: the name to search for
    /// - Returns: reference image or nil if there is no image found
    static func loadImage(imageName: String) -> ARReferenceImage? {
        // check if we can use AR reference images
        guard referenceImages != nil else {
            // try to load the images in background
            load()
            return nil
        }
        
        // search for the image with given name
        for referenceImage in referenceImages {
            // check if reference image has a name
            if let name = referenceImage.name {
                // check if that name is the one we are looking for
                if name == imageName {
                    // found — return the found image
                    return referenceImage
                }
            }
        }
        
        // nothing is found — return nil
        return nil
    }
    
    /// Initialize assignment with all 4 properties
    ///
    /// - Parameters:
    ///   - image: AR reference image
    ///   - imageName: the name of AR reference image
    ///   - question: quiz question to what AR reference image is an answer
    ///   - answer: text answer to the quiz question
    init(image: ARReferenceImage?, imageName: String, question: String, answer: String) {
        // assign all properties
        self.image = image
        self.imageName = imageName
        self.question = question
        self.answer = answer
    }

    /// Initialize assignment with 3 of 4 properties
    ///
    /// - Parameters:
    ///   - imageName: the name of AR reference image
    ///   - question: quiz question to what AR reference image is an answer
    ///   - answer: text answer to the quiz question
    init(imageName: String, question: String, answer: String) {
        // assign all properties via full initializer
        self.init(image: nil, imageName: imageName, question: question, answer: answer)
        
        // try to get image propery from imageName
        image = Assignment.loadImage(imageName: imageName)
    }
}

// The array with assignments
var assignments: TrackedArray = TrackedArray(
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
