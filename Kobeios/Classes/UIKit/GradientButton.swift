//
//  GradientButton.swift
//  Kobeios
//
//  Created by Thomas Delgado on 20/08/18.
//

import UIKit

@IBDesignable
public class GradientButton: UIButton {

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBInspectable var firstColor: UIColor = UIColor(red: 130/255.0, green: 230/255.0, blue: 235/255.0, alpha: 1) {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor(red: 86/255.0, green: 123/255.0, blue: 204/255.0, alpha: 1) {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var horizontal: Bool = true {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var diagonal: Bool = false {
        didSet {
            updateView()
        }
    }
    
    override public class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [firstColor, secondColor].map{$0.cgColor}
        if horizontal {
            layer.startPoint = CGPoint(x: 0, y: 0.5)
            layer.endPoint = CGPoint (x: 1, y: 0.5)
        } else {
            layer.startPoint = CGPoint(x: 0.5, y: 0)
            layer.endPoint = CGPoint (x: 0.5, y: 1)
        }
        if diagonal {
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint (x: 1, y: 1)
        }
    }
}
