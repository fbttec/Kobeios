//
//  KobeViewable.swift
//  Pods
//
//  Created by Rodrigo F Leite on 31/08/17.
//
//

import UIKit

public extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        layer.mask = maskLayer
    }
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat, roundedRect: CGRect)
    {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: roundedRect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        layer.mask = maskLayer
    }
    
    func roundCornerColor(borderColor: UIColor = .clear, borderWidth: CGFloat = 0, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        clipsToBounds = true
    }
    
    @IBInspectable var circularCorner: Bool {
        get {
            return self.circularCorner
        }
        set {
            if newValue == true {
                self.circularCorners()
            } else {
                layer.cornerRadius = 0
            }
        }
    }
    
    @IBInspectable var roundedCorner: Bool {
        get {
            return self.roundedCorner
        }
        set {
            if newValue == true {
                self.roundCorners()
            } else {
                layer.cornerRadius = 0
            }
        }
    }
    
    func addShadow(opacity: Float = 1, shadowRadius: CGFloat = 7, cornerRadius: CGFloat = 5, corners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]) {
        backgroundColor = UIColor.white
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.1).cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = shadowRadius
        layer.cornerRadius = cornerRadius
        if #available(iOS 11.0, *) {
            layer.maskedCorners = corners
        }
    }
    
    func circularCorners() {
        roundCornerColor(radius: frame.size.width/2.0)
    }
    
    func roundCorners() {
        roundCornerColor(radius: frame.size.height/2.0)
    }
    
    func roundCorners(color: UIColor) {
        roundCornerColor(borderColor: color, borderWidth: 1.0, radius: frame.size.height/2.0)
    }
    
    func roundCorners(radius: CGFloat) {
        roundCornerColor(borderColor: .clear, borderWidth: 1.0, radius: radius)
    }
    
    func roundCornersLight() {
        roundCornerColor(borderWidth: 1.0, radius: 6.0)
    }
    
}
