//
//  RegisterService.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 27/01/24.
//

import Foundation 

class RegisterService{
    static let shared = RegisterService()
    
    
    func validateMail(email: String, completion: @escaping(GeneralResponse) -> ()){
        
        guard let url = URL(string: Constants.baseUrl+"validate_email.php")else{
            return
        }
        
        let datos: Data = "email=\(email)".data(using: .utf8)!
        
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
        request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language");
        request.httpBody = datos
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request){
            data, response, error in
            
            guard let data = data, error == nil else {return}
            
            do{
                let generalResponse = try? JSONDecoder().decode(GeneralResponse.self, from: data)
                
                completion(generalResponse!)
            }
            
        }
        
        task.resume()

    }
    
    
    
    func registerUser(name: String, lastname: String, email: String, password: String, completion: @escaping(GeneralResponse) -> ()){
        
        
       guard let url = URL(string: Constants.baseUrl+"insert_user.php")else{
            return
        }
        
        let datos: Data = "name=\(name)&lastname=\(lastname)&email=\(email)&password=\(password)".data(using: .utf8)!
        
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
        request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language");
        request.httpBody = datos
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request){
            data, response, error in
            
            guard let data = data, error == nil else {return}
            
            do{
                
                let generalResponse = try? JSONDecoder().decode(GeneralResponse.self, from: data)
                
                completion(generalResponse!)
      
            }
            
        }
        
        task.resume()
      
        
    }
    
    func login(email: String, pass: String, completion: @escaping(LoginResponse) -> ()) {
        
        guard let url = URL(string: Constants.baseUrl+"login.php") else{
            return
        }
       
        let datos : Data = "email=\(email)&pass=\(pass)".data(using: .utf8)!
        
        var request : URLRequest = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
        request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language");
        request.httpBody = datos
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
    
        let task = session.dataTask(with: request){
            data, response, error in
            
            guard let data = data, error == nil else {return}
            
            do{
                let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data)
                
                completion(loginResponse!)
            }
            
        }
        
        task.resume()
        
    }
}
