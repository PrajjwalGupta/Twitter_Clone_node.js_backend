//
//  RegisterView.swift
//  Twitter_Clone_node
//
//  Created by Prajjwal Gupta on 23/11/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = AuthViewModel()
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
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
            Text("Create your account")
                .font(.title)
                .bold()
                .padding(.top, 35)
            VStack (alignment: .leading) {
                CustomAuthTextField(placeholder: "Name", text: $name)
                CustomAuthTextField(placeholder: "Phone number or email", text: $email)
                SecureAuthTextField(placeholder: "Password", text: $password)
            }
            Spacer(minLength: 0)
            VStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                HStack{
                    Spacer()
                    Button(action: {
                        self.viewModel.register(reqBody: ["username": "sam112", "name": name, "email": email, "password": "12345678"])
                    }, label: {
                        Capsule().frame(width: 100, height: 40, alignment: .center)
                            .foregroundColor(Color(red: 29/255, green: 161/255, blue: 242/255))
                            .overlay {
                                Text("Next")
                                    .foregroundStyle(.white)
                            }
                    }).padding(.trailing, 24)
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}
