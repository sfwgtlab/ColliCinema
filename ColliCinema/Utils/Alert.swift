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
    var alert: Bool
    
    init(message: String, alert: Bool) {
        self.message = message
        self.alert = alert
    }
    
    func showAlert() -> Alert{
        return Alert(
            title:  alert ? Text(LocalizedStringKey("txt_title_modal_alert")) : Text(LocalizedStringKey("txt_title_modal_success")),
            message: Text(message),
            dismissButton: .cancel(Text("OK"))
        )
    }
}
