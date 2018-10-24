//
//  EmbedViewController.swift
//  Kobeios
//
//  Created by Thomas Delgado on 08/10/18.
//

import UIKit

public class EmbedViewController: UIView {
    var rootViewController: UIViewController?
    public var embeddedViewController: UIViewController? {
        didSet {
            guard let rootViewController = rootViewController,
                let embeddedViewController = embeddedViewController else { return }
            if let viewController = oldValue {
                remove(controller: viewController)
            }
            rootViewController.addChild(embeddedViewController)
            embeddedViewController.view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(embeddedViewController.view)

            if #available(iOS 9.0, *) {
                NSLayoutConstraint.activate([
                    embeddedViewController.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                    embeddedViewController.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                    embeddedViewController.view.topAnchor.constraint(equalTo: self.topAnchor),
                    embeddedViewController.view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
                    ])
            }

            embeddedViewController.didMove(toParent: rootViewController)
            embeddedViewController.view.alpha = 0
            UIView.animate(withDuration: 0.4) {
                embeddedViewController.view.alpha = 1
            }
        }
    }
    
    public convenience init(rootViewController: UIViewController, locationView: UIView ) {
        self.init()
        self.rootViewController = rootViewController        
        translatesAutoresizingMaskIntoConstraints = false
        locationView.addSubview(self)
        if #available(iOS 9.0, *) {
            NSLayoutConstraint.activate([
                self.leadingAnchor.constraint(equalTo: locationView.leadingAnchor, constant: 0),
                self.trailingAnchor.constraint(equalTo: locationView.trailingAnchor, constant: 0),
                self.topAnchor.constraint(equalTo: locationView.topAnchor, constant: 0),
                self.bottomAnchor.constraint(equalTo: locationView.bottomAnchor, constant: 0),
                ])
        }
    }
    
    func remove(controller: UIViewController) {
        controller.willMove(toParent: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParent()
    }

}
