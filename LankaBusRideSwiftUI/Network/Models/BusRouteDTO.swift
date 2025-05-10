//
//  BusRouteDTO.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-10.
//

import Foundation

struct BusRouteDTO: Decodable {
    let id: Int
    let title: String
    let source: String
    let destination: String
    let departureTime: String
    let arrivalTime: String
    let stops: [String]

    func toDomain() -> BusRoute {
        return BusRoute(
            id: id,
            title: title,
            source: source,
            destination: destination,
            departureTime: departureTime,
            arrivalTime: arrivalTime,
            stops: stops
        )
    }
}

