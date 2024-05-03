//
//  HomeService.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 02/05/24.
//

import Foundation

class HomeService {
    static let shared = HomeService()
    
    func getCities(completion: @escaping (CitiesResponse) -> ()){
        
        guard let url = URL(string: Constants.baseUrl+"cities.php") else{
            return
        }
        
        var request : URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
        request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language");
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request){
            data, response, error in
            
            guard let data = data, error == nil else {return}
            
            do{
                let cities = try? JSONDecoder().decode(CitiesResponse.self, from: data)
                
                completion(cities!)
            }
            
        }
        
        task.resume()
        
    }
    
    func getCinemas(city: String){
        
    }
}
