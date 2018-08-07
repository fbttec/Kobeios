//
//  LayoutExtensions.swift
//  Kobeios
//
//  Created by Thomas Delgado on 06/08/18.
//

import Foundation

public extension UIViewController {
    
    func getTopSafeArea() -> CGFloat {
        var topSafeArea: CGFloat
        if #available(iOS 11.0, *) {
            topSafeArea = view.safeAreaInsets.top
        } else {
            topSafeArea = topLayoutGuide.length
        }
        return topSafeArea
    }
    
}
