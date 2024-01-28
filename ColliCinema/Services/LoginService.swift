//
//  LoginService.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 07/11/23.
//

import Foundation

class LoginService{
    
    static let shared = LoginService()
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
        
       
        

    
        //return  try? JSONDecoder().decode(LoginResponse.self, from: data)
        /*let task = session.dataTask(with: request){
            data, response, error in
            guard let data = data, error == nil else{return}
                do{
                    DispatchQueue.main.async {
                        let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data)
                        self.loginInfo = loginResponse
                       // print("entro a main async")
                       // print(loginResponse)
                    }
                }
        }*/
        
        
        
        /*let task = session.dataTask(with: request, completionHandler: {
                (data, response, error) in
                 if let error = error
                {
                    print(error)
                }
                 else if let response = response {
                    print("her in resposne")
                }else if let data = data
                 {
                    print("here in data")
                    print(data)
                }
                DispatchQueue.main.async { // Correct
                    guard let responseData = data else {
                        print("Error: did not receive data")
                        return
                    }
                    let decoder = JSONDecoder()
                    do {
                        let todo = try decoder.decode(LoginResponse.self, from: responseData)
                        self.loginInfo = todo
                        print(self.loginInfo)
                       
                    } catch {
                        print("error trying to convert data to JSON")
                        //print(error)
                      //  NSAssertionHandler(.failure(error))
                    }
                }
            })*/
           // task.resume()
        //return loginInfo
        
    }
}
