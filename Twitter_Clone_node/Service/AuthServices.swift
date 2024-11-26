//
//  AuthServices.swift
//  Twitter_Clone_node
//
//  Created by Prajjwal Gupta on 24/11/24.
//

import Foundation
import SwiftUI

enum Networkerror: Error {
    case invalidURL
    case noData
    case decodingError
}

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMeassage: String)
}

public class AuthServices {
    
    public static var requestDomain = ""
    
    //User login
    
    static func login(email: String, password: String, completion: @escaping(_ result: Result<Data?, AuthenticationError>) -> Void) {
        let urlString = URL(string: "http://localhost:3007/users/login")!
        makeRequest(urlString: urlString, reqBody: ["email": email, "password": password]) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(.invalidCredentials))
                
            }
        }
    }
  
    //Register user
    
    static func register(email: String, username: String, password: String, name: String, completion: @escaping(_ result: Result<Data?, AuthenticationError>) -> Void) {
        let urlString = URL(string: "http://localhost:3007/users")!
        
        makeRequest(urlString: urlString, reqBody: ["email": email, "username": username, "name": name, "password": password]) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(.invalidCredentials))
                
            }
        }
    }
    //Fetch users
    static func fetchUser(id: String, completion: @escaping (_ result: Result<Data, AuthenticationError>) -> Void) {
        let urlString = URL(string: "http://localhost:3007/users/\(id)")!
        let session = URLSession.shared
        var urlRequest = URLRequest(url: urlString)
        
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: urlRequest) { data, res, error in
            guard let error = error else {
                return
            }
            guard let data = data else {
                return
                completion(.failure(.invalidCredentials))
            }
            completion(.success(data))
            
            do {
                if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    
                }
            } catch let error {
                completion(.failure(.invalidCredentials))
                print(error)
            }
           
        }
        task.resume()
        
    }
    
    
    
    
    
    
    static func makeRequest(urlString: URL, reqBody: [String: Any], completion: @escaping (_ result: Result<Data?, Networkerror>) -> Void) {
        
            let session = URLSession.shared
            var request = URLRequest(url: urlString)
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
                    completion(.failure(.noData))
                    return
                }
                completion(.success(data))
                do {
                    if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        
                    }
                } catch let error {
                    completion(.failure(.decodingError))
                    print(error)
                }
            }
            task.resume()
        }
   
}
