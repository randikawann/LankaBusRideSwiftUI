//
//  AvailableBusRouteCell.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-14.
//

import SwiftUI

struct AvailableBusRouteCell: View {
    let route: BusRoute
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("\(route.source) → \(route.destination)")
                .font(.headline)
            Text("Company: \(route.companyName)")
            Text("From: \(route.departure)  To: \(route.arrival)")
            Text("Duration: \(route.duration)")
            Text("Route #: \(route.routeNumber)")
        }
        .padding()
    }
}
