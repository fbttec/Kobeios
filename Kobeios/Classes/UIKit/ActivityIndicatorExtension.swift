//
//  ActivityIndicatorExtension.swift
//  Kobeios
//
//  Created by Thomas Delgado on 12/07/18.
//

import Foundation
import UIKit

extension UIViewController {
    
    struct AssociatedKeys {
        static var buttonState: UInt8 = 0
    }
    
    private var storedButtonItem: UIBarButtonItem? {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.buttonState) as? UIBarButtonItem else {
                return nil
            }
            return value
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.buttonState, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public func startAnimating() {
        let activity = UIActivityIndicatorView(style: .gray)
        let barButton = UIBarButtonItem(customView: activity)
        activity.startAnimating()
        storedButtonItem = self.navigationItem.rightBarButtonItem
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    public func stopAnimating() {
        self.navigationItem.rightBarButtonItem = storedButtonItem
    }
}



