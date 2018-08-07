//
//  StringExtension.swift
//  Kobeios
//
//  Created by Thomas Delgado on 26/07/18.
//

import Foundation

public extension String {
    
    func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        let date = dateFormatter.date(from: self)
        return date
    }
    
}
