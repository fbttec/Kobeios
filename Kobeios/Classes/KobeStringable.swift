//
//  Stringable.swift
//  Pods
//
//  Created by Rodrigo F Leite on 31/08/17.
//
//

import Foundation

public protocol KobeStringable {}

public extension KobeStringable {
    
    func kbIsValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    func kbIsPasswordValid(password: String) -> Bool {
        return password.characters.count >= 5
    }
    
}
