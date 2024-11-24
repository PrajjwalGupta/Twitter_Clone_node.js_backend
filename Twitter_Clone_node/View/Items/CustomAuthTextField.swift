//
//  CustomAuthTextField.swift
//  Twitter_Clone_node
//
//  Created by Prajjwal Gupta on 23/11/24.
//

import SwiftUI

struct CustomAuthTextField: View {
    var placeholder: String
    @Binding var text: String
    var body: some View {
        VStack {
            ZStack(alignment: .leading, content: {
                if text.isEmpty {
                    Text(placeholder).foregroundColor(.gray)
                }
                TextField("", text: $text)
                    .frame(height: 45)
                    .foregroundColor(Color(red: 29/255, green: 161/255, blue: 242/255))
            })
            Rectangle()
                .frame(height: 1, alignment: .center)
                .foregroundColor(.gray)
                .padding(.top, -2)
        }.padding(.horizontal)
    }
}

//#Preview {
//    CustomAuthTextField()
//}
