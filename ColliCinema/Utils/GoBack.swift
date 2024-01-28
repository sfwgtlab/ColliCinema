//
//  GoBack.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 29/10/23.
//

import Foundation
import SwiftUI

class GoBack {
    var presentationMode: Binding<PresentationMode>
    
    init(presentationMode: Binding<PresentationMode>) {
        self.presentationMode = presentationMode
    }
    
    func goBack(){
        self.presentationMode.wrappedValue.dismiss()
    }
}
