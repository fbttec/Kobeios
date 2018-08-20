//
//  DateExtension.swift
//  Kobeios
//
//  Created by Thomas Delgado on 15/08/18.
//

import Foundation

extension Date {
    
    public func daysBetween(date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: self, to: date).day!
    }
    
    public func hoursBetween(date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: self, to: date).hour!
    }
}
