//
//  Dynamic.swift
//  Pods
//
//  Created by Rodrigo F Leite on 31/08/17.
//
//

import Foundation

/// Dynamic is a basic class to perform binding between the view and the viewModel
class KobeDynamic<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ val: T) {
        value = val
    }
}

