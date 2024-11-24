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
    func register(reqBody: [String: Any]) {
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "http://localhost:3007/users")!)
        request.httpMethod = "POST"
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: reqBody, options: .prettyPrinted)
        } catch let error {
            print(error)
        }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                return
            }
            guard let data = data else {
                return
            }
            do {
                if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    
                }
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
    func logout() {
        
    }
}


