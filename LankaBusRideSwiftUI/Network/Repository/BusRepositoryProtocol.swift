//
//  BusRepositoryProtocol.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-10.
//

import Foundation

protocol BusRepositoryProtocol {
    func fetchRoutes(completion: @escaping (Bool, [BusRoute]?, NetworkError?) -> Void)
    func fetchBusDetails(busRouteId: Int, completion: @escaping (Bool, BusDetail?, NetworkError?) -> Void)
}
