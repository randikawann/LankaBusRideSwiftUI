//
//  MockUserRepository.swift
//  LankaBusRideSwiftUITests
//
//  Created by ranCreation on 2025-05-12.
//

import Foundation
@testable import LankaBusRideSwiftUI


final class MockUserRepository: UserRepositoryProtocol {
    var mockUser: User?

    func fetchUser(completion: @escaping (Bool, User?, NetworkError?) -> Void) {
        if let user = mockUser {
            completion(true, user, nil)
        } else {
            completion(false, nil, .noData)
        }
    }
}
