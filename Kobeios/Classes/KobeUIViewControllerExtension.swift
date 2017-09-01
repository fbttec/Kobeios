//
//  KobeUIViewControllerExtension.swift
//  Pods
//
//  Created by Rodrigo F Leite on 31/08/17.
//
//

import UIKit

public extension UIViewController {
    
    func displaySimpleAlert(title: String, action: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: nil,
                                                message: title,
                                                preferredStyle: .alert)
        let action = UIAlertAction(title:"Ok", style: .default, handler: action)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func displayAlertMessage(message: String, successTitle: String, failureTitle: String, action:@escaping (UIAlertAction) -> Void) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: successTitle, style: .default, handler: action)
        let cancelAction = UIAlertAction(title: failureTitle, style: .cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
