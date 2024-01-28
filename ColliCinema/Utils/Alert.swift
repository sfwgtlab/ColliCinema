//
//  Alert.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 29/10/23.
//

import Foundation
import SwiftUI



class AlertView{
    
    var message: String
    
    init(message: String) {
        self.message = message
    }
    
    func showAlert() -> Alert{
        return Alert(
            title: Text(LocalizedStringKey("txt_title_modal")),
            message: Text(message),
            dismissButton: .cancel(Text("OK"))
        )
    }
}
