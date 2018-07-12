//
//  TextfieldLabeled.swift
//  Kobeios
//
//  Created by Thomas Delgado on 05/07/18.
//

import UIKit

@IBDesignable
public class TextfieldLabeled: UITextField {
    
    @IBInspectable
    public var underlineColor: UIColor = UIColor.darkGray {
        didSet {
            configureUnderline(frame: frame)
        }
    }
    
    var underline: UIView?
    public var label: UILabel?
    
    @IBInspectable
    public var labelHidden: Bool = true {
        didSet {
            configureLabel()
            configureUnderline(frame: frame)
        }
    }
    
    @IBInspectable
    public var labelColor: UIColor = UIColor.red {
        didSet {
            label?.textColor = labelColor
        }
    }
    
    @IBInspectable
    public var labelText: String? {
        didSet {
            label?.text = labelText
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
        configureUnderline(frame: frame)
        self.borderStyle = .none
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureLabel()
        configureUnderline(frame: frame)
        self.borderStyle = .none
    }
    
    func configureUnderline(frame: CGRect) {
        if underline == nil {
            underline = UIView()
        }
        underline?.backgroundColor = labelHidden ? underlineColor : labelColor
        underline?.frame = CGRect(x: 0,
                                 y: frame.size.height + 7,
                                 width: frame.size.width, height: 1)
        self.addSubview(underline!)
    }
    
    func configureLabel() {
        if label == nil {
            label = UILabel()
        }
        label?.frame = CGRect.init(origin: CGPoint(x: frame.origin.x,
                                                   y: frame.origin.y + frame.size.height + 7),
                                   size: CGSize(width: frame.size.width, height: frame.size.height))
        label?.textAlignment = .right
        label?.minimumScaleFactor = 0.5
        label?.lineBreakMode = .byTruncatingHead
        label?.font = UIFont(name: (self.font?.fontName)!, size: 12)        
        label?.text = labelText
        label?.isHidden = false
        label?.textColor = labelColor
        label?.alpha = labelHidden ? 0 : 1
        self.superview?.addSubview(label!)
    }
    
    public func showLabel(_ show: Bool) {
        if show {
            label?.alpha = 0
            UIView.animate(withDuration: 0.5) {
                self.label?.alpha = 1
                self.underline?.backgroundColor = self.labelColor
            }
        } else {
            label?.alpha = 1
            UIView.animate(withDuration: 0.5) {
                self.label!.alpha = 0
                self.underline!.backgroundColor = self.underlineColor
            }
        }
        self.labelHidden = !show
    }
}
