//
//  WelcomeView.swift
//  Twitter_Clone_node
//
//  Created by Prajjwal Gupta on 23/11/24.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView{
            VStack {
                HStack {
                    Spacer(minLength: 0)
                    Image("logo")
                        .resizable()
                        .scaledToFill()
                        .padding(.trailing)
                        .frame(width: 60, height: 60)
                    Spacer(minLength: 0)
                }
                Spacer(minLength: 0)
                Text("See what's happing in the world right now...")
                    .font(.system(size: 30, weight: .heavy, design: .default))
                    .frame(width: (getRect().width * 0.9), alignment: .center)
                Spacer(minLength: 0)
                VStack(alignment: .center) {
                    Button(action: {print("Sign in with Google")}, label: {
                        HStack(spacing: -4) {
                            Image("google")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                            Text("Continue with Google")
                                .fontWeight(.bold)
                                .font(.title3)
                                .foregroundColor(.black)
                                .padding()
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 36).stroke(Color.black, lineWidth: 1)
                                .opacity(0.3)
                                .frame(width: 320, height: 60, alignment: .center)
                        }
                    })
                    Button(action: {print("Sign in with Apple")}, label: {
                        HStack(spacing: -4) {
                            Image("apple")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                            Text("Continue with Apple")
                                .fontWeight(.bold)
                                .font(.title3)
                                .foregroundColor(.black)
                                .padding()
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 36).stroke(Color.black, lineWidth: 1)
                                .opacity(0.3)
                                .frame(width: 320, height: 60, alignment: .center)
                        }
                    })
                    HStack() {
                        Rectangle()
                            .foregroundColor(.gray)
                            .opacity(0.3)
                            .frame(width: (getRect().width)*0.35, height: 1)
                        Text("Or")
                            .foregroundColor(.gray)
                        Rectangle()
                            .foregroundColor(.gray)
                            .opacity(0.3)
                            .frame(width: (getRect().width)*0.35, height: 1)
                    }
                    NavigationLink(destination: RegisterView().navigationBarHidden(true)) {
                        RoundedRectangle(cornerRadius: 36)
                            .foregroundColor(Color(red: 29/255, green: 161/255, blue: 242/255))
                            .frame(width: 320, height: 60, alignment: .center)
                            .overlay {
                                Text("Create account")
                                    .fontWeight(.bold)
                                    .font(.title3)
                                    .foregroundStyle(.white)
                                    .padding()
                            }.padding(.bottom)
                    }
                    VStack (alignment: .leading) {
                        VStack {
                            Text("By signup you agree to our ")
                            +
                            Text("Terms")
                                .foregroundStyle(.blue)
                            +
                            Text(", ")
                            +
                            Text("Privacy").foregroundStyle(.blue)
                            +
                            Text(", ")
                            +
                            Text("Policy ").foregroundStyle(.blue)
                            +
                            Text("and Cookie Use.")
                        }
                        .padding(.bottom)
                        HStack(spacing: 2) {
                            Text("Have an account already? ")
                            NavigationLink(destination: LoginView().navigationBarHidden(true)) {
                                Text("Sign in").foregroundStyle(.blue)
                            }
                        }.padding(.bottom)
                    }
                }
            }.navigationBarHidden(true)
                .navigationBarTitle("")
        }
    }
}

#Preview {
    WelcomeView()
}
