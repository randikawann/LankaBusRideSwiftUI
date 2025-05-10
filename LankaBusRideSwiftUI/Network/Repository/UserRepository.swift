//
//  UserRepository.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-10.
//

import Foundation

final class UserRepository: UserRepositoryProtocol {
    private let apiManager = APIManager.shared

    func fetchUser(completion: @escaping (Result<User, Error>) -> Void) {
        apiManager.request(endpoint: .getUserDetails) { (result: Result<UserDTO, Error>) in
            switch result {
            case .success(let dto):
                completion(.success(dto.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
