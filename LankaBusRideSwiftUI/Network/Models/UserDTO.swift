//
//  UserDTO.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-10.
//

import Foundation

struct UserDTO: Decodable {
    let id: Int
    let name: String
    let email: String
    let profilePictureURL: String

    func toDomain() -> User {
        return User(id: id, name: name, email: email, profilePictureURL: profilePictureURL)
    }
}
