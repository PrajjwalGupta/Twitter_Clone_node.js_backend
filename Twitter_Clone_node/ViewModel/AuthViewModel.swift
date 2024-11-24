//
//  AuthViewModel.swift
//  Twitter_Clone_node
//
//  Created by Prajjwal Gupta on 24/11/24.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    func login() {
        
    }
    func register(email: String, name: String, username: String, password: String) {
        
        AuthServices.register(email: email, username: username, password: password, name: name) { result in
            switch result {
            case .success(let data):
                guard let user = try? JSONDecoder().decode(ApiResponse.self, from: data as! Data) else { return }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }
    func logout() {
        
    }
}


