//
//  UsersViewModel.swift
//  Codable
//
//  Created by Kushal Mukherjee on 03/10/23.
//

import Foundation


protocol UsersViewModelDelegate: AnyObject {
    func getUsersCompletion()
}

class UsersViewModel {
    
    var users: [User] = []
    
    weak var delegate: UsersViewModelDelegate?
    
    func getUsers() {
        NetworkManager.shared.fetchUsers { [weak self] data, err in
            DispatchQueue.main.async {
                guard let self = self, let data = data, err == nil else {
                    return
                }
                self.users = try! JSONDecoder().decode(UsersResponse.self, from: data).users
                do {
                    self.users = try JSONDecoder().decode(UsersResponse.self, from: data).users
                    self.delegate?.getUsersCompletion()
                } catch let err {
                    print(err.localizedDescription)
                }
            }
            
        }
        
    }
    
    
}
