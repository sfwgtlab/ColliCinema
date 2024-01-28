//
//  Home.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 27/10/23.
// 

import SwiftUI

struct Home: View {
    var pad: CGFloat = 40
    
   
    
    var body: some View {
        NavigationStack{
            ZStack{
                Ellipse()
                    .fill(Color("Primary"))
                    .frame(width: 554, height: 170)
                    .padding(pad)
            }
        }
        .navigationBarBackButtonHidden()
          
        
    }
}

#Preview {
    Home()
}
