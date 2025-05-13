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

    func fetchRoutes(completion: @escaping (Bool, [BusRoute]?, NetworkError?) -> Void) {
        completion(true, mockRoutes, nil)
    }
}
