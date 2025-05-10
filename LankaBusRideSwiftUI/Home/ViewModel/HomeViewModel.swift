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
        userRepository.fetchUser { [weak self] result in
            DispatchQueue.main.async {
                if case .success(let user) = result {
                    self?.user = user
                }
            }
        }

        busRepository.fetchRoutes { [weak self] result in
            DispatchQueue.main.async {
                if case .success(let routes) = result {
                    self?.routes = routes
                }
            }
        }
    }
}
