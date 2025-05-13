//
//  HomeViewModel.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-10.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var user: User?
    @Published var routes: [BusRoute] = []

    private let userRepository: UserRepositoryProtocol
    private let busRepository: BusRepositoryProtocol

    init(
        userRepository: UserRepositoryProtocol = UserRepository(),
        busRepository: BusRepositoryProtocol = BusRepository()
    ) {
        self.userRepository = userRepository
        self.busRepository = busRepository
    }

    func loadData() {
        userRepository.fetchUser { [weak self] isSuccess, user, error in
            DispatchQueue.main.async {
                if isSuccess, let user = user {
                    self?.user = user
                } else {
                    print("Failed to fetch user:", error)
                }
            }
        }
        
        busRepository.fetchRoutes { [weak self] isSuccess, routes, error in
            DispatchQueue.main.async {
                if isSuccess, let routes = routes {
                    self?.routes = routes
                } else {
                    print("Failed to fetch routes:", error)
                }
            }
        }
    }
}
