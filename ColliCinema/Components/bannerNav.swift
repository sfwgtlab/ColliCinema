//
//  bannerNav.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 28/04/24.
//

import SwiftUI

struct bannerNav: View {
    var body: some View {
        ZStack{
            HStack{
                Spacer()
                Text("Hola de nuevo!")
                    .foregroundStyle(.white)
                    .font(.system(size: 22))
                    .padding(.leading, 30)
                Spacer()
                Image(systemName: "person.circle")
                    .foregroundStyle(.white)
                    .font(.system(size: 30))
                    .padding(.top, -5)
            }
            .frame(width: UIScreen.main.bounds.size.width * 0.9)
            .padding(.top, -30)
        }
    }
}

#Preview {
    bannerNav()
}
