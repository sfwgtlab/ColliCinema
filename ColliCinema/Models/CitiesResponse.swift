//
//  CitiesResponse.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 02/05/24.
//

import Foundation

struct CitiesResponse: Decodable {
    let message: String
    let codigo: Int
    let data: Cities
}
