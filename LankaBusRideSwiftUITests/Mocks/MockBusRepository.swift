//
//  MockBusRepository.swift
//  LankaBusRideSwiftUITests
//
//  Created by ranCreation on 2025-05-12.
//

import Foundation
@testable import LankaBusRideSwiftUI

final class MockBusRepository: BusRepositoryProtocol {
    var fetchRoutesResult: (Bool, [BusRoute]?, NetworkError?)?
    
    func fetchRoutes(completion: @escaping (Bool, [BusRoute]?, NetworkError?) -> Void) {
        if let result = fetchRoutesResult {
            completion(result.0, result.1, result.2)
        } else {
            completion(false, nil, nil)
        }
    }
}
