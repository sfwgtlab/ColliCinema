//
//  RecoveryPass.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 27/10/23.
//

import SwiftUI

struct RecoveryPass: View {
    @State var mail: String = ""
    @StateObject var recoveryVM: RecoveryPassViewModel  = RecoveryPassViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack{
            VStack{
                bannerLogin(pad: -40)
                if(recoveryVM.loading){
                    HStack{
                        ProgressView()
                            .progressViewStyle(.circular)
                            .scaleEffect(2)
                    }
                
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .center
                    )
                }else{
                    VStack{
                        Text(LocalizedStringKey("txt_recovery_title"))
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .padding(.bottom, 10)
                        Text(LocalizedStringKey("txt_recovery_subtitle"))
                            .font(.subheadline)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                        HStack{
                            Image(systemName: "envelope.fill")
                                .padding(.horizontal, 2)
                            TextField(LocalizedStringKey("txt_email"), text: $recoveryVM.email)
                                .onChange(of: recoveryVM.email){ oldValue, newValue in
                                    recoveryVM.validateEmail()
                                }
                                .textInputAutocapitalization(.never)
                            
                                
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.black, lineWidth: 0.1)
                                .padding(-10)
                        )
                        .padding()
                        .keyboardType(.emailAddress)
                        .foregroundColor(.black)
                    }
                    .frame(width: 350, height: 240)
                    .background(Color.white)
                    .cornerRadius(25)
                    .shadow(color: .black, radius:10 , x:5 , y: 5)
                    Spacer()
                    VStack{
                        HStack{
                            Button{
                                recoveryVM.sendEmail()
                            }label: {
                                HStack{
                                    Text(LocalizedStringKey("txt_acept"))
                                }
                                .frame(width: 250, height: 40)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(10)
                                .padding(.horizontal)
                                .background(recoveryVM.disableButton ? Color("Disable") : Color("Primary"))
                                .cornerRadius(20)
                            }
                        }
                        .padding(.vertical, 10)
                        
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
                        .padding(.vertical, 10)
                        
                    }
                    .frame(width: 350, height: 30)
                    .padding(20)
                    Spacer()
                    
                    bannerLogin(pad: -100)
                }
            }
            .background( recoveryVM.loading ? Color.black.opacity(0.2): nil )
            .ignoresSafeArea()
           
        }.navigationBarBackButtonHidden()
        
            .alert(isPresented: $recoveryVM.showAlert, content: {
                AlertView(message: recoveryVM.message, alert: recoveryVM.alert).showAlert()
            })
    }
    
    
}

#Preview {
    RecoveryPass()
}
