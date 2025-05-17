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
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "bus.fill")
                .resizable()
                .frame(width: 36, height: 36)
                .foregroundColor(.blue)
                .padding(8)
                .background(Circle().fill(Color.yellow.opacity(0.4)))

            VStack(alignment: .leading, spacing: 6) {
                Text(bus.companyName)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("From:")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(bus.source)
                            .font(.headline)
                            .foregroundColor(.blue)
                    }

                    VStack(alignment: .leading, spacing: 2) {
                        Text("To:")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(bus.destination)
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                }

                HStack {
                    Text("From: \(bus.departure)  To: \(bus.arrival)")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 8) {
                Text(bus.routeNumber)
                    .font(.caption.bold())
                    .foregroundColor(.green)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 4)
                    .background(Color.black)
                    .cornerRadius(6)

                Text(bus.duration)
                    .font(.caption2)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.cyan.opacity(0.3))
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
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
