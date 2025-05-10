//
//  UserRepositoryProtocol.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-10.
//

import Foundation

protocol UserRepositoryProtocol {
    func fetchUser(completion: @escaping (Result<User, Error>) -> Void)
}
