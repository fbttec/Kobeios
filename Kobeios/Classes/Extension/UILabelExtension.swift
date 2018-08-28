//
//  UILabelExtension.swift
//  Kobeios
//
//  Created by Thomas Delgado on 27/08/18.
//

import Foundation
import UIKit

public extension UILabel {
    
    func setCharacterSpacing(characterSpacing: CGFloat = 0.0) {
        guard let labelText = text else { return }
        
        let attributedString: NSMutableAttributedString
        if let labelAttributedText = attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelAttributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // Character spacing attribute
        attributedString.addAttribute(NSAttributedStringKey.kern, value: characterSpacing, range: NSMakeRange(0, attributedString.length))
        
        attributedText = attributedString
    }
    
}
