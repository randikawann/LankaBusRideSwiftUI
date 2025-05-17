//
//  DetailView.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-15.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel = DetailViewModel()
    let busID: Int
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                
                // Title Section
                VStack(spacing: 4) {
                    Text(viewModel.title)
                        .font(.title3)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                }
                
                // Bus Icon
                Image(systemName: "bus.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .padding()
                    .background(Circle().fill(Color.yellow.opacity(0.3)))
                    .foregroundColor(.blue)
                
                // Route Section
                HStack(alignment: .center, spacing: 16) {
                    RouteStopView(city: "Kandy", time: viewModel.busDetail?.departure ?? "")
                    
                    Image(systemName: "arrow.right")
                        .font(.title)
                        .foregroundColor(.gray)
                    
                    RouteStopView(city: "Colombo", time: viewModel.busDetail?.arrival ?? "")
                }
                .padding(.horizontal)
                
                // Route Number
                Text(viewModel.busDetail?.routeNumber ?? "N/A")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color.green.opacity(0.2))
                    .foregroundColor(.red)
                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                
                // Info Grid
                VStack(spacing: 16) {
                    InfoRow(icon: "bus.doubledecker", label: "Bus Type", value: viewModel.busType)
                    InfoRow(icon: "clock.arrow.circlepath", label: "Duration", value: viewModel.duration)
                    InfoRow(icon: "creditcard", label: "Fare", value: viewModel.fareText)
                    InfoRow(icon: "mappin.and.ellipse", label: "Popular Stops", value: viewModel.popularStops)
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
            .padding()
        }
        .onAppear {
            viewModel.loadBusDetail(id: busID) {}
        }
        .navigationTitle("Bus Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(busID: 1)
}
