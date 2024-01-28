//
//  bannerLogin.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 29/10/23.
//

import SwiftUI

struct bannerLogin: View {
    var pad: CGFloat
    var body: some View {
        ZStack{
            Ellipse()
                .fill(Color("Primary"))
                .frame(width: 554, height: 170)
                .padding(pad)
        }
    }
}

#Preview {
    bannerLogin(pad: 1)
}
