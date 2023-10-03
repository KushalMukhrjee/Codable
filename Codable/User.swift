//
//  Users.swift
//  Codable
//
//  Created by Kushal Mukherjee on 03/10/23.
//

import Foundation

struct User: Codable {
    var id: Int
    var email: String
    var firstName: String
    var lastName: String
    var avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatarUrl = "avatar"
    }
}

struct UsersResponse: Codable {
    let users: [User]
    
    enum CodingKeys: String, CodingKey {
        case users = "data"
    }
}
