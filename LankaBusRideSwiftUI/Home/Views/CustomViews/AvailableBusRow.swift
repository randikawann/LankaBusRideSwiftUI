//
//  AvailableBusRow.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-12.
//

import SwiftUI

struct AvailableBusRow: View {
    let bus: BusRoute
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "bus")
                .resizable()
                .frame(width: 40, height: 40)
                .padding(8)
                .background(Circle().fill(Color.yellow.opacity(0.5)))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(bus.companyName)
                    .font(.subheadline)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("From: \(bus.departure)")
                            .font(.caption)
                        Text(bus.source)
                            .font(.headline)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("To: \(bus.arrival)")
                            .font(.caption)
                        Text(bus.destination)
                            .font(.headline)
                    }
                }
            }
            Spacer()
            VStack {
                Text(bus.routeNumber)
                    .bold()
                    .foregroundColor(.green)
                    .padding(4)
                    .background(Color.black)
                    .cornerRadius(4)
                
                Text(bus.duration)
                    .foregroundColor(.brown)
                    .padding(4)
                    .background(Color.cyan.opacity(0.3))
                    .cornerRadius(4)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}

#Preview {
    AvailableBusRow(bus: BusRoute(
        id: 1,
        companyName: "SLTB Super Luxury",
        source: "Colombo",
        destination: "Jaffna",
        departure: "06:00",
        arrival: "14:30",
        routeNumber: "EX001",
        duration: "8h 30m"
    ))
}
