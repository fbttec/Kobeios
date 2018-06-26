//
//
// Copyright 2018 Kobe, Inc.
// All rights reserved.
//
// This file, its contents, concepts, methods, behavior, and operation
// (collectively the “Software”) are protected by trade secret, patent,
// and copyright laws. The use of the Software is governed by a license
// agreement. Disclosure of the Software to third parties, in any form,
// in whole or in part, is expressly prohibited except as authorized by
// the license agreement.
//

import UIKit

struct Router {
    
    static func show(viewController: UIViewController?, isAnimated: Bool = true) {
        guard let viewController = viewController else { return }
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let snapShot = appDelegate?.window?.snapshotView(afterScreenUpdates: true) else {
            return
        }
        if isAnimated {
            Router.presentViewControllerAnimated(viewController: viewController, snapShot: snapShot)
        } else {
            let  appDelegate = UIApplication.shared.delegate as? AppDelegate
            appDelegate?.window?.rootViewController = viewController
        }
    }
    
    fileprivate static func presentViewControllerAnimated(viewController: UIViewController, snapShot: UIView) {
        let  appDelegate = UIApplication.shared.delegate as? AppDelegate
        viewController.view.addSubview(snapShot)
        appDelegate?.window?.rootViewController = viewController
        UIView.animate(withDuration: 1.0, animations: {
            snapShot.layer.opacity = 0
            snapShot.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
        }, completion: { _ in
            snapShot.removeFromSuperview()
        })
    }
    
}
