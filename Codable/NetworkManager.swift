//
//  NetworkManager.swift
//  Codable
//
//  Created by Kushal Mukherjee on 03/10/23.
//

import Foundation


class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchUsers(completion: @escaping (Data?, Error?) -> ()) {
        let usersApi = "https://reqres.in/api/users"
        guard let url = URL(string: usersApi) else {
            completion(nil, nil)
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, _, err in
            completion(data,err)
        }.resume()
        
    }
    
    
}
