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
    let popularStops: [String]
    let fare: Int
    let busType: String

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
    
    func toDomainDetail() -> BusDetail {
        BusDetail(
            id: id,
            title: "\(company) | \(source) → \(destination)",
            companyName: company,
            source: source,
            destination: destination,
            departure: departure,
            arrival: arrival,
            routeNumber: routeNumber,
            duration: duration,
            popularStops: popularStops,
            fare: fare,
            busType: busType
        )
    }
}

