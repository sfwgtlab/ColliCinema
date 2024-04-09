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
    @Published var loading: Bool = false
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var alert: Bool = false
    @Published var generalResponse: GeneralResponse?
    
    func register(){
        
        print("entro a register")
        RegisterService.shared.registerUser(name: name, lastname: lastName, email: email, password: password){ result in
            DispatchQueue.main.async {[self] in
                loading = false
                self.generalResponse = result
                self.alertMessage = result.message
                showAlert.toggle()
                if(result.codigo != 100){
                    alert = true
                }
            }
            
        }
      
    }
    
    func validateUser(){
        loading = true
        alert =  false
        
        RegisterService.shared.validateMail(email: email) { result in
            DispatchQueue.main.async { [self] in
                
                self.generalResponse = result
                self.alertMessage = result.message
                if(result.codigo == 100){
                    loading = false
                    showAlert.toggle()
                    alert = true
                }else{
                    register()
                }
            }
            
        }
    }
    
    func validateFields() {
        
        if (!Validations().validatePassword(pass: password) 
            || !Validations().validateEmail(email: email)
            || password != confirmPassword
            || name.isEmpty
            || lastName.isEmpty){
            disableButton = true
            
        }else{
            disableButton = false
            
        }
        
    }
    
    
}
