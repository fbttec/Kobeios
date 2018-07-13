//
//  KobeKeyboardable.swift
//  Pods
//
//  Created by Rodrigo F Leite on 31/08/17.
//
//

import Foundation

/// Keyboardable protocol was develop to control the keyboard and the textfield that was hit by the user
public protocol Keyboardable {
    var scrollView: UIScrollView! { get }
}

public extension Keyboardable where Self: UIViewController {
    
    func registerForKeyboardNotifications() {
        _ = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: nil) { [weak self] (notification) in
            self?.keyboardWasShown(notification: notification)
        }
        
        _ = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: nil) { [weak self] (notification) in
            self?.keyboardWillBeHidden(notification: notification)
        }
    }
    
    func deregisterFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWasShown(notification: Notification) {
        if let info = notification.userInfo as NSDictionary?,
            let size = (info[UIKeyboardFrameEndUserInfoKey] as? NSValue) {
            
            scrollView.isScrollEnabled = true
            let keyboardSize = size.cgRectValue.size
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
            var textField: UITextField?
            findActiveTextField(subviews: view.subviews, textField: &textField)
            if let textField = textField {
                scrollView.scrollRectToVisible(textField.frame, animated: true)
            }
        }
    }
    
    func keyboardWillBeHidden(notification: Notification) {
        if let info = notification.userInfo as NSDictionary?,
            let size = (info[UIKeyboardFrameEndUserInfoKey] as? NSValue) {
             let keyboardSize = size.cgRectValue.size
            let contentInsets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: -keyboardSize.height, right: 0.0)
            scrollView?.contentInset = contentInsets
            scrollView?.scrollIndicatorInsets = contentInsets
            scrollView.isScrollEnabled = false
        self.view.endEditing(true)
        }
    }
    
    private func findActiveTextField (subviews: [UIView], textField: inout UITextField?) {
        for view in subviews {
            if let tf = view as? UITextField, view.isFirstResponder {
                textField = tf
                break
            } else if !view.subviews.isEmpty {
                findActiveTextField (subviews: view.subviews, textField: &textField)
            }
        }
    }
    
}
