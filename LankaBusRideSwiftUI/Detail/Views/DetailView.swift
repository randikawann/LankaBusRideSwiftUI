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
        VStack(spacing: 20) {
            Image(systemName: "bus.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .padding()
                .background(Circle().fill(Color.yellow))
                .foregroundColor(.blue)
            
            HStack {
                VStack {
                    Text("Kandy")
                        .font(.title3)
                        .bold()
                    Text(viewModel.busDetail?.departure ?? "")
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(systemName: "arrow.right")
                    .font(.title2)
                
                Spacer()
                
                VStack {
                    Text("Colombo")
                        .font(.title3)
                        .bold()
                    Text(viewModel.busDetail?.arrival ?? "")
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            
            Text(viewModel.busDetail?.routeNumber ?? "")
                .font(.title2)
                .bold()
                .foregroundColor(.red)
                .padding()
                .background(Color.green.opacity(0.2))
                .cornerRadius(8)
            
            
            infoArray
            Spacer()
        }.onAppear {
            viewModel.loadBusDetail(id: busID) {
            }
        }.navigationTitle(viewModel.title )
    }
    
    private var infoArray: some View {
        VStack(alignment: .leading, spacing: 8) {
            InfoRow(label: "Bus Type:", value: viewModel.busType)
            InfoRow(label: "Duration:", value: viewModel.duration)
            InfoRow(label: "Fare:", value: viewModel.fareText)
            InfoRow(label: "Popular stops:", value: viewModel.popularStops)
        }
        .padding()
    }
}

#Preview {
    DetailView(busID: 1)
}
