//
//  BusRepositoryProtocol.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-10.
//

import Foundation

protocol BusRepositoryProtocol {
    func fetchRoutes(completion: @escaping (Result<[BusRoute], Error>) -> Void)
}
