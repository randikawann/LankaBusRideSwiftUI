//
//  RouteStopView.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-17.
//

import SwiftUI

struct RouteStopView: View {
    let city: String
    let time: String

    var body: some View {
        VStack {
            Text(city)
                .font(.title3)
                .fontWeight(.semibold)
            Text(time)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    RouteStopView(city: "csd", time: "08:00")
}
