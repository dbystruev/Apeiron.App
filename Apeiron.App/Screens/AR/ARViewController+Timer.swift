//
//  ARViewController+Timer.swift
//  Apeiron.App
//
//  Created by Denis Bystruev on 02/09/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import UIKit

extension ARViewController {
    
    /// Start the timer for a given number of seconds
    ///
    /// - Parameter value: how many seconds to countdown
    func startTimer(value: Int = 30) {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: timerEvent)
    }
    
    /// Called every tick of a timer
    func timerEvent(timer: Timer) {
        // check if we won/lost
        if won || timerValue == 0 {
            // stop the countdown
            timer.invalidate()
            
            // pause the view's session
            sceneView.session.pause()
            
            // retrieve the current answer
            let answer = assignments.current.answer
            
            // will assign different values if won or lost
            let text = won ? "Верно!" : "Поздно!"
            let textColor = won ? #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1) : #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)

            // update the labels
            DispatchQueue.main.async {
                self.topLabel.text = answer
                self.middleLabel.alpha = 1
                self.middleLabel.text = text
                self.middleLabel.textColor = textColor
            }
        } else {
            // decrement timer value
            timerValue = max(0, timerValue - 1)
        }
    }
}
