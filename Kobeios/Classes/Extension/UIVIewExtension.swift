//
//  KobeViewable.swift
//  Pods
//
//  Created by Rodrigo F Leite on 31/08/17.
//
//

import UIKit

@IBDesignable 
public extension UIView {
    
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
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: self.layer.borderColor ?? UIColor.clear.cgColor)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var dropShadow: Bool {
        get {
            return self.dropShadow
        }
        set {
            if newValue == true {
                removeShadow()
                addDefaultShadow()
            } else {
                removeShadow()
            }
        }
    }
    
    @IBInspectable var shadowColor: UIColor {
        get {
            return UIColor(cgColor: self.layer.shadowColor ?? UIColor.black.cgColor)
        }
        set {
            layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowXOffset: CGFloat {
        get {
            return layer.shadowOffset.width
        }
        set {
            layer.shadowOffset = CGSize(width: newValue, height: shadowYOffset)
        }
    }
    
    @IBInspectable var shadowYOffset: CGFloat {
        get {
            return layer.shadowOffset.height
        }
        set {
            layer.shadowOffset = CGSize(width: shadowXOffset, height: newValue)
        }
    }
    
    
    func addDefaultShadow() {
        dropShadow(offsetX: 0, offsetY: 0, color: UIColor.black, opacity: 0.3, radius: 10)
    }
    
    func removeShadow() {
         dropShadow(offsetX: 0, offsetY: 0, color: UIColor.black, opacity: 0, radius: 0)
    }
    
    func dropShadow(offsetX: CGFloat, offsetY: CGFloat, color: UIColor, opacity: Float, radius: CGFloat, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: offsetX, height: offsetY)
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func circularCorners() {
        roundCorner(radius: frame.size.width/2.0)
    }
    
    func roundCorners() {
        roundCorner(radius: frame.size.height/2.0)
    }
    
    func roundCorner(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    
    
}
