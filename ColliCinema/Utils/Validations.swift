//
//  Validations.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 06/01/24.
//

import Foundation

class Validations {
    
    func validateEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func validatePassword(pass: String) -> Bool{
        let passRegEx = #"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$"#
        let passPred =  NSPredicate(format:"SELF MATCHES %@", passRegEx)
        return passPred.evaluate(with: pass)
    }
}
