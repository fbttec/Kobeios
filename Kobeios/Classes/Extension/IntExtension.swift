//
//  IntExtension.swift
//  Kobeios
//
//  Created by Thomas Delgado on 03/09/18.
//

import Foundation

public extension Int {
    
    public var asWord: String {
        let numberValue = NSNumber(value: self)
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return formatter.string(from: numberValue)!
    }
    
}
