//
//  RegisterViewModel.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 13/01/24.
//

import Foundation

class RegisterViewModel: ObservableObject{
    
    @Published var name: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var showPassword: Bool = false
    @Published var showConfirmPassword: Bool = false
    @Published var disableButton: Bool = true
    
    
    func register(){
        
    }
    
    func validateFields() {
        
        if(!Validations().validatePassword(pass: password)){
            disableButton = true
        }else{
            disableButton = false
        }
        
    
    }
    
}
