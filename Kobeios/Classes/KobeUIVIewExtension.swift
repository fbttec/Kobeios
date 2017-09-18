//
//  KobeViewable.swift
//  Pods
//
//  Created by Rodrigo F Leite on 31/08/17.
//
//

import UIKit

public extension UIView {
    
    func kbRoundedCornerColor(borderColor: UIColor = .clear, borderWidth: CGFloat = 0, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        clipsToBounds = true
    }
    
    func kbRoundedSideBorder() {
        kbRoundedCornerColor(radius: frame.size.height/2.0)
    }
    
}
