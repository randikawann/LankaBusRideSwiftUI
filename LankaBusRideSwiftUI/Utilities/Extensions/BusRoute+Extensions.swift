//
//  BusRoute+Extensions.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-14.
//

import Foundation

extension Array where Element == BusRoute {
    func filteredByRoute(by routeInfo: RouteInfo?) -> [BusRoute] {
        guard let routeInfo = routeInfo else { return [] }
        return self.filter { $0.routeNumber == routeInfo.routeNumber }
    }
}
