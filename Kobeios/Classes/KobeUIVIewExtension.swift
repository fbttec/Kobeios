//
//  KobeViewable.swift
//  Pods
//
//  Created by Rodrigo F Leite on 31/08/17.
//
//

import UIKit

public extension UIView {
    
    func roundedCornerColor(borderColor: UIColor = .clear, borderWidth: CGFloat = 0, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        clipsToBounds = true
    }
    
    func roundedSideBorder() {
        roundedCornerColor(radius: frame.size.height/2.0)
    }
    
}
