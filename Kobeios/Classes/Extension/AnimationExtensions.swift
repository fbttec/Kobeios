//
//  AnimationExtensions.swift
//  Kobeios
//
//  Created by Thomas Delgado on 06/09/18.
//

import Foundation


public extension UIView {
// Usage: insert view.fadeTransition right before changing content
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionFade
        animation.duration = duration
        layer.add(animation, forKey: kCATransitionFade)
    }
    
}
