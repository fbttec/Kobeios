//
//  KobeUIViewControllerExtension.swift
//  Pods
//
//  Created by Rodrigo F Leite on 31/08/17.
//
//

import UIKit

public extension UIViewController {
    
    func displayAlert(title: String, message: String, action: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: StringMessages.okButton, style: .default, handler: action)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func displayAlert(message: String, action: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: nil,
                                                message: message,
                                                preferredStyle: .alert)
        let action = UIAlertAction(title: StringMessages.okButton, style: .default, handler: action)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func displayConfirmationAlert(message: String,
                                  action: @escaping (UIAlertAction) -> Void) {
        displayConfirmationAlert(message: message, okTitle: StringMessages.okButton, cancelTitle: StringMessages.cancelButton, action: action)
    }
    
    func displayConfirmationAlert(message: String, okTitle: String, cancelTitle: String, action:@escaping (UIAlertAction) -> Void) {
        let alertController = UIAlertController(title: nil,
                                                message: message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: okTitle, style: .default, handler: action)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
