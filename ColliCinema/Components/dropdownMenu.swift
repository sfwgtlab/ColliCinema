//
//  dropdownMenu.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 28/04/24.
//

import SwiftUI

struct dropdownMenu: View {
    @State private var optionPressed : Bool = false
    var list: [String] = []
    @Binding  var selectedOption: String
    @State  var placeholder = ""
    let actionSelected: (_ item: String) -> Void
    
   
    var body: some View {
        Button(action: {
            optionPressed.toggle()
        }){
            HStack{
                Text(self.selectedOption.isEmpty ? self.placeholder : self.selectedOption)
                    .foregroundColor(.black)
                    .padding(.leading, 5)
                    .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.black)

            }
        }
        .padding(8)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(.gray, lineWidth: 1)
        )
        .overlay(alignment: .top){
            VStack{
                Spacer(minLength: 40)
                if(optionPressed){
                    ScrollView{
                        LazyVStack(alignment: .leading, spacing: 2 ){
                            ForEach(list, id: \.self) { item in
                                Button(action: {
                                    optionPressed = false
                                    self.actionSelected(item)
                                    print("lo que vale selected optionx2", self.selectedOption)
                                }){
                                    Text(item)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .foregroundColor(.black)
                                .padding(.vertical, 5)
                                .padding(.horizontal)
                            }
                           
                        }
                    }
                    .frame(height: 100)
                    .padding(.vertical, 5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray)
                    )
                }
                    
                
            }
        }
       
        
        
    }
}

#Preview {
    dropdownMenu(list: [], selectedOption: .constant(""), placeholder: "", actionSelected: {_ in})
}
