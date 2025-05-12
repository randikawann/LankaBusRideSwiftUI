//
//  MockBusRepository.swift
//  LankaBusRideSwiftUITests
//
//  Created by ranCreation on 2025-05-12.
//

import Foundation
@testable import LankaBusRideSwiftUI

final class MockBusRepository: BusRepositoryProtocol {
    var mockRoutes: [BusRoute] = []

    func fetchRoutes(completion: @escaping (Result<[BusRoute], Error>) -> Void) {
        completion(.success(mockRoutes))
    }
}
