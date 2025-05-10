//
//  BusRoute.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-10.
//

import Foundation

struct BusRoute: Identifiable {
    let id: Int
    let title: String
    let source: String
    let destination: String
    let departureTime: String
    let arrivalTime: String
    let stops: [String]
}
