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
            TextField("Enter route number", text: $viewModel.routeNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            if viewModel.routeNumber.isEmpty {
                Text("No searched values. Please select a Recent route")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                filteredRoutesList
                    .listStyle(PlainListStyle())
            }
            
            Divider().padding(.vertical)
            
            Text("Recent Routes")
                .font(.headline)
                .padding(.top)
            
            recentRoutesList
                .listStyle(PlainListStyle())
        }
        .onAppear {
            viewModel.loadTopRoutes()
        }
    }
    private var filteredRoutesList: some View {
        List(viewModel.filteredBusRoutes, id: \.id) { route in
            AvailableBusRouteCell(route: route)
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
