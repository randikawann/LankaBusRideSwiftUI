//
//  BusRouteDTO.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-10.
//

import Foundation

struct BusRouteDTO: Decodable {
    let id: Int
    let company: String
    let source: String
    let destination: String
    let departure: String
    let arrival: String
    let routeNumber: String
    let duration: String

    func toDomain() -> BusRoute {
        return BusRoute(
            id: id,
            companyName: company,
            source: source,
            destination: destination,
            departure: departure,
            arrival: arrival,
            routeNumber: routeNumber,
            duration: duration
        )
    }
}

