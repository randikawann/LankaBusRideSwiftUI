//
//  RouteInfoCell.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-14.
//

import SwiftUI

struct RouteInfoCell: View {
    let route: RouteInfo
    var body: some View {
        Text(route.routeNumber)
    }
}
