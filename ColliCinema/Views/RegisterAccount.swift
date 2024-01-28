//
//  RegisterAccount.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 28/10/23.
//

import SwiftUI

struct RegisterAccount: View {
    @StateObject var registerVM: RegisterViewModel = RegisterViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack{
            VStack{
                bannerLogin(pad: -40)
                VStack{
                    Text(LocalizedStringKey("txt_registration_title"))
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(.bottom, 25)
                    
                    HStack{
                        Image(systemName: "person.fill")
                            .padding(.horizontal, 2)
                        TextField(LocalizedStringKey("txt_name"), text: $registerVM.name)
                        
                            
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.black, lineWidth: 0.1)
                            .padding(-10)
                    )
                    .padding()
                    .keyboardType(.default)
                    .foregroundColor(.black)
                    
                    HStack{
                        Image(systemName: "person.fill")
                            .padding(.horizontal, 2)
                        TextField(LocalizedStringKey("txt_lastname"), text: $registerVM.lastName)
                        
                            
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.black, lineWidth: 0.1)
                            .padding(-10)
                    )
                    .padding()
                    .keyboardType(.default)
                    .foregroundColor(.black)
                    
                    
                    HStack{
                        Image(systemName: "envelope.fill")
                            .padding(.horizontal, 2)
                        TextField(LocalizedStringKey("txt_email"), text: $registerVM.email)
                        
                            
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.black, lineWidth: 0.1)
                            .padding(-10)
                    )
                    .padding()
                    .keyboardType(.default)
                    .foregroundColor(.black)
                    
                    
                    HStack{
                        Image(systemName: "lock.fill")
                            .padding(.horizontal, 2)
                        SecureField(LocalizedStringKey("txt_pass"), text: $registerVM.password)
                            .onChange(of: registerVM.password){ oldValue, newValue in
                                registerVM.validateFields()
                            }
                        
                            
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.black, lineWidth: 0.1)
                            .padding(-10)
                    )
                    .padding()
                    .keyboardType(.default)
                    .foregroundColor(.black)
                    
                    
                    HStack{
                        Image(systemName: "lock.fill")
                            .padding(.horizontal, 2)
                        SecureField(LocalizedStringKey("txt_confirm_pass"), text: $registerVM.confirmPassword)
                        
                            
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.black, lineWidth: 0.1)
                            .padding(-10)
                    )
                    .padding()
                    .keyboardType(.default)
                    .foregroundColor(.black)
                    
                    
                }
                .frame(width: 350, height: 430)
                .background(Color.white)
                .cornerRadius(25)
                .shadow(color: .black, radius:10 , x:5 , y: 5)
                .padding(.bottom, 70)
                VStack{
                    HStack{
                        Button{
                            GoBack(presentationMode: self.presentationMode).goBack()
                        }label: {
                            HStack{
                                Text(LocalizedStringKey("txt_acept"))
                            }
                            .frame(width: 250, height: 40)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(10)
                            .padding(.horizontal)
                            .background(registerVM.disableButton ? Color("Disable") : Color("Primary"))
                            .cornerRadius(20)
                        }
                        .disabled(registerVM.disableButton)
                    }
                    
                    HStack{
                        Button{
                            GoBack(presentationMode: self.presentationMode).goBack()
                        }label: {
                            HStack{
                                Text(LocalizedStringKey("txt_cancel"))
                            }
                            .frame(width: 250, height: 40)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(10)
                            .padding(.horizontal)
                            .background(Color("Tertiary"))
                            .cornerRadius(20)
                        }
                        
                    }
                    
                }
                .frame(width: 350, height: 30)
                .padding(20)
                Spacer()
                bannerLogin(pad: -100)
            }
            .ignoresSafeArea()
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    RegisterAccount()
}
