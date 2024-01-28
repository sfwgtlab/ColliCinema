//
//  LoginResponse.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 07/11/23.
//

import Foundation

struct LoginResponse: Decodable{
    let message: String?
    let codigo: Int
    let data: User?
}
