//
//  EmbedViewController.swift
//  Kobeios
//
//  Created by Thomas Delgado on 08/10/18.
//

import UIKit

class EmbedViewController: UIView {
    var rootViewController: UIViewController?
    var embeddedViewController: UIViewController? {
        didSet {
            guard let rootViewController = rootViewController,
                let embeddedViewController = embeddedViewController else { return }
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
        }
    }
    
    convenience init(rootViewController: UIViewController, locationView: UIView ) {
        self.init()
        self.rootViewController = rootViewController        
        translatesAutoresizingMaskIntoConstraints = false
        locationView.addSubview(self)
        if #available(iOS 9.0, *) {
            NSLayoutConstraint.activate([
                self.leadingAnchor.constraint(equalTo: locationView.leadingAnchor, constant: 10),
                self.trailingAnchor.constraint(equalTo: locationView.trailingAnchor, constant: -10),
                self.topAnchor.constraint(equalTo: locationView.topAnchor, constant: 10),
                self.bottomAnchor.constraint(equalTo: locationView.bottomAnchor, constant: -10),
                ])
        }
    }

}
