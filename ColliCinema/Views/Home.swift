//
//  Home.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 27/10/23.
// 

import SwiftUI


struct Home: View {
    @State private var selection = ""
    let colors = ["Ciudad", "Green", "Blue", "Black", "Tartan"]
    let cities: [String] = ["Binario", "Decimal", "Octal", "Hexadecimal"]
    @State private var selectedOption: String = ""
    @StateObject private var homeVM: HomeViewModel = HomeViewModel()
   
    
    var body: some View {
        NavigationStack{
            VStack{
                
                    bannerLogin(pad: -40)
                    bannerNav()
                
                Spacer()
                ScrollView(showsIndicators: false) {
                    
                    VStack{
                        dropdownMenu(list: cities, selectedOption: $selectedOption, placeholder: "Selecciona una ciudad" ){ option in
                            self.selectedOption = option
                        }
                        .frame(width: UIScreen.main.bounds.size.width * 0.7)
                        .padding(.top, UIScreen.main.bounds.size.height * 0.05)
                    }
                    .frame(width:  UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0.1)
                    Spacer().frame(height: UIScreen.main.bounds.height * 0.04)
                    
                    if(homeVM.citySelected == 0){ //cambiar a mayor que 0
                        VStack{
                            dropdownMenu(list: cities, selectedOption: $selectedOption, placeholder: "Selecciona una cine" ){ option in
                                self.selectedOption = option
                            }
                            .frame(width: UIScreen.main.bounds.size.width * 0.7)
                            .padding(.top, UIScreen.main.bounds.size.height * 0)
                        }
                        .frame(width:  UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0)
                    }
                    
                    if(homeVM.cinemaSelected == 0 ){ //cambiar a mayor que 0
                        Spacer().frame(height: UIScreen.main.bounds.height * 0.05)
                        ScrollView(.horizontal, showsIndicators: false){
                            LazyHStack{
                                ForEach(cities, id: \.self){ item in
                                    VStack{
                                        AsyncImage(url: URL(string: "https://i.ytimg.com/vi/9PWtn1kj9Yo/maxresdefault.jpg")){ //cambiar url
                                            phase in
                                            
                                            if let image = phase.image {
                                                image.resizable()
                                                    .scaledToFill()
                                                    .frame(width: UIScreen.main.bounds.size.width * 0.5, height: UIScreen.main.bounds.height * 0.1)
                                                    .clipped()
                                            }else{
                                                ProgressView()
                                            }
                                        }
                                    }
                                    .cornerRadius(20)
                                    .frame(width: UIScreen.main.bounds.size.width * 0.5, height: UIScreen.main.bounds.height * 0.1)
                                    .border(Color.blue, width: 0)
                                }
                            }
                            .frame( height: UIScreen.main.bounds.height * 0.15)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 0)
                        }
                        .padding(.horizontal, 30)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 0)
                        
                        Spacer().frame(height: UIScreen.main.bounds.height * 0.05)
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: UIScreen.main.bounds.size.width * 0.4))], spacing: 30){
                            ForEach(0..<4){ item in
                            
                                    AsyncImage(url: URL(string: "https://i.ytimg.com/vi/9PWtn1kj9Yo/maxresdefault.jpg")){ //cambiar url
                                        phase in
                                        
                                        if let image = phase.image {
                                            image.resizable()
                                                .scaledToFill()
                                                .frame(width: UIScreen.main.bounds.size.width * 0.4, height: UIScreen.main.bounds.height * 0.15)
                                        }else{
                                            ProgressView()
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.size.width * 0.42, height: UIScreen.main.bounds.height * 0.1)
                                    .cornerRadius(15)
                                    .onTapGesture {
                                        homeVM.goto(screen: String(item))
                                    }
                            }
                        }
                        .padding(.horizontal, 15)
                        .border(Color.blue, width: 0)
                        
                    }else{
                        
                    }
                        
                    

                    
                }
                .border(Color.black, width: 0)
                
                bannerLogin(pad: -100)
                
                
                
                
            }
            .ignoresSafeArea()
        }
        
        .navigationBarBackButtonHidden()
          
        
    }
    
}

#Preview {
    Home()
}
