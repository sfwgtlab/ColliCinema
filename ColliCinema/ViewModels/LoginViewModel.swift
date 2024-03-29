//
//  LoginViewModel.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 07/11/23.
//

import Foundation
import SwiftUI


class LoginViewModel: ObservableObject{
    @Published var loginResponse: LoginResponse?
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    @Published var showAlert: Bool = false
    @Published var disableButton: Bool = true
    @Published var message: String = ""
    @Published var homePath = NavigationPath()
    @Published var gotoHome = false
    @Published var loading = false
    
    func login(){
        loading = true
        LoginService.shared.login(email: email, pass: password) { result in
            DispatchQueue.main.async { [self] in
                
                self.loginResponse = result
                self.message = result.message!
                print("valor")
                print(result)
                result.codigo == 200 ? (showAlert.toggle()) : (goToHome())
            }
        }
        
        
    }
    
    func validateFields(){
        
        if(email.isEmpty || password.isEmpty || password.count < 6 || !Validations().validateEmail(email: email)){
            disableButton = true
        }else{
            disableButton = false
        }
    }
    
    
    func goToHome(){
        loading = false
        gotoHome = true
    }
    
    
}
