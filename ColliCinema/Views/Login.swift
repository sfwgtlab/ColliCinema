//
//  Login.swift
//  ColliCinema
//
//  Created by Eduardo Gutiérrez on 26/10/23.
//

import SwiftUI

struct Login: View {
    @State var pad: CGFloat = -40
    @StateObject var loginVM: LoginViewModel =  LoginViewModel()
    var body: some View {
       
        NavigationStack{
            
            VStack{
                bannerLogin(pad: -40)
                VStack{
                    
                    Image("cine")
                        .resizable()
                        .frame(width: 140, height: 150, alignment: .center)
                        .scaledToFill()
                    HStack{
                        Image(systemName: "person.fill")
                            .padding(.horizontal, 2)
                        TextField(LocalizedStringKey("txt_user"), text: $loginVM.email)
                            .onChange(of: loginVM.email){ oldValue, newValue in
                                loginVM.validateFields()
                            }
                            .textInputAutocapitalization(.never)
                        
                            
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
                        
                        !loginVM.showPassword ?
                        AnyView(SecureField(LocalizedStringKey("txt_pass"), text: $loginVM.password)
                            .onChange(of: loginVM.password){ oldValue, newValue in
                                loginVM.validateFields()
                            })
                        :
                        AnyView(TextField(LocalizedStringKey("txt_pass"), text: $loginVM.password)
                            .onChange(of: loginVM.password){ oldValue, newValue in
                                loginVM.validateFields()
                            })
                        Button{
                            Task{
                                loginVM.showPassword.toggle()
                            }
                        }label: {
                            Image(systemName: loginVM.showPassword ? "eye.slash.fill" : "eye.fill")
                                .padding(.horizontal, 2)
                        }
                        
                            
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 0.1)
                            .padding(-10)
                    )
                    .padding()
                    .keyboardType(.default)
                    .foregroundColor(.black)
                        
                    Spacer()
                    if(loginVM.loading){
                        VStack{
                            ProgressView()
                                .progressViewStyle(.circular)
                                .scaleEffect(2)
                        }
                        
                    }
                }
                .frame(width: 350, height: 350)
                .background(  loginVM.loading ? Color.white.opacity(0.25) : Color.white)
                .cornerRadius(25)
                .shadow(color: .black, radius:10 , x:5 , y: 5)
                HStack{
                    
                    NavigationLink{
                        RecoveryPass()
                    }label: {
                        Text( "Recuperar contraseña")
                            .foregroundStyle(.black)
                    }
                }
                .frame(width: 350, height: 30, alignment: .trailing)
                Spacer()
                VStack{
                    Button{
                        Task{
                            loginVM.login()
                        }
                    }label: {
                        HStack{
                            Text(LocalizedStringKey("txt_login"))
                        }
                        .frame(width: 250, height: 40)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(10)
                        .padding(.horizontal)
                        .background(loginVM.disableButton ? Color("Disable") : Color("Primary") )
                        .cornerRadius(20)
                    }
                    .disabled(loginVM.disableButton)
                    
                    
                }
                .frame(width: 350, height: 30)
                .padding(20)
                
                VStack{
                    NavigationLink{
                        RegisterAccount()
                    }label: {
                        Text(LocalizedStringKey("txt_create_account"))
                            .foregroundStyle(.black)
                    }
                }
                .frame(width: 350, height: 20)
                .padding(30)
               
                Spacer()
                
                bannerLogin(pad: -100)
                    
               
                    
            }
            .background( loginVM.loading ? Color.black.opacity(0.2): nil )
            .navigationDestination(isPresented: .constant(loginVM.gotoHome)){
                Home()
            }
            .ignoresSafeArea()
            
        
        }
        
        .alert(isPresented: $loginVM.showAlert, content: {
            AlertView(message: loginVM.message, alert: loginVM.alert).showAlert()
        })
        
       
    }
    
   
}


#Preview {
    Login()
}
