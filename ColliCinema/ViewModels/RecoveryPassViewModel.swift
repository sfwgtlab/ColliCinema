//
//  RecoveryPassViewModel.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 07/04/24.
//

import Foundation


class RecoveryPassViewModel: ObservableObject {
    @Published var response: GeneralResponse?
    @Published var loading: Bool = false
    @Published var email: String = ""
    @Published var message: String = ""
    @Published var showAlert: Bool = false
    @Published var disableButton: Bool = true
    @Published var alert: Bool = false
    
    
    func sendEmail(){
        loading = true
        RecoveryPassService.shared.sendEmail(email: email){ result in
            DispatchQueue.main.async { [self] in
                self.loading = false
                self.response = result
                self.message = result.message
                showAlert = true
                
            }
        }
    }
    
    func validateEmail(){
        print("entra a validacion")
        if(Validations().validateEmail(email: email)){
            disableButton = false
            print("habilitado")
        }
    }
}



