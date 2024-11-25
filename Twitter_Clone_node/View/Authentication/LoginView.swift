//
//  LoginView.swift
//  Twitter_Clone_node
//
//  Created by Prajjwal Gupta on 23/11/24.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @State var emailDone = false
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        if !emailDone {
            VStack {
                VStack {
                    ZStack {
                        HStack {
                            Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                                Text("Cancel")
                                    .foregroundColor(.blue)
                            })
                            Spacer()
                        }.padding(.horizontal)
                        Image("logo")
                            .resizable()
                            .scaledToFill()
                            .padding(.trailing)
                            .frame(width: 40, height: 40)
                    }
                    Text("To get started first enter your phone, email or @username")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    CustomAuthTextField(placeholder: "Phone, Email or Username", text: $email)
                }
                Spacer(minLength: 0)
                VStack {
                    Button(action: {
                       
                        if !email.isEmpty {
                            self.emailDone.toggle()
                        }
                        
                    }, label: {
                        Capsule().frame(width: 360, height: 40, alignment: .center)
                            .foregroundColor(Color(red: 29/255, green: 161/255, blue: 242/255))
                            .overlay(
                                Text("Next")
                                    .foregroundColor(.white)
                            )
                    }).padding(.bottom, 4)
                    Text("Forgot username?")
                        .foregroundColor(.blue)
                }
            }
        } else {
            VStack {
                VStack {
                    ZStack {
                        HStack {
                            Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
                                Text("Cancel")
                                    .foregroundColor(.blue)
                            })
                            Spacer()
                        }.padding(.horizontal)
                        Image("logo")
                            .resizable()
                            .scaledToFill()
                            .padding(.trailing)
                            .frame(width: 40, height: 40)
                    }
                    Text("Enter Your password")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    SecureAuthTextField(placeholder: "Password", text: $password)
                }
                Spacer(minLength: 0)
                VStack {
                    Button(action: {
                        self.viewModel.login(email: email, password: password)
                    }, label: {
                        Capsule().frame(width: 360, height: 40, alignment: .center)
                            .foregroundColor(Color(red: 29/255, green: 161/255, blue: 242/255))
                            .overlay(
                                Text("Log in")
                                    .foregroundColor(.white)
                            )
                    }).padding(.bottom, 4)
                    Text("Forgot password?")
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
