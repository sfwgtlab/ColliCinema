//
//  User.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 07/11/23.
//

import Foundation

struct User: Codable{
    let nombre: String
    let apellido: String
    let numero_cliente: String
    let token_tarjeta: String
    let correo: String
}
