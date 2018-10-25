//
//  Rsult.swift
//  Kobeios
//
//  Created by Thomas Delgado on 11/07/18.
//

import Foundation

public enum Result<T> {
    case success(T)
    case failure(Error)
}
