//
//  SearchView.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-13.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color("LightGreen"))
                .frame(height: 100)
                .overlay(
                    VStack{
                        Text("Your location")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 16)
                            .foregroundColor(Color("PrimaryGreen"))
                        TextField("Enter route number", text: $viewModel.routeNumber)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 16)
                            .disabled(true)
                    }
                )
                .padding(.horizontal, 16)
                .shadow(color: .gray.opacity(0.4), radius: 6, x: 0, y: 4)
            Text("Recent Routes")
                .font(.headline)
                .padding(.top)
            VStack {
                recentRoutesList
                    .listStyle(PlainListStyle())
            }.frame(height: 150.0)
            
            ScrollView {
                if viewModel.routeNumber.isEmpty {
                    VStack(alignment: .leading) {
                        Text("No searched values. Please select a Recent route")
                            .foregroundColor(.gray)
                            .padding()
                    }
                } else {
                    VStack(spacing: 12) {
                        ForEach(viewModel.filteredBusRoutes, id: \.self) { route in
                            AvailableBusRow(bus: route)
                                .padding(.horizontal, 16)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            
            Divider().padding(.vertical)
        }
        .onAppear {
            viewModel.loadTopRoutes()
        }
    }
    
    private var recentRoutesList: some View {
        List(viewModel.allRouteInfos, id: \.id) { route in
            Button {
                viewModel.selectedRoute = route
            } label: {
                RouteInfoCell(route: route)
            }
        }
    }
}

#Preview {
    SearchView()
}
