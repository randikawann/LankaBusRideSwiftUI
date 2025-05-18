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
        NavigationView {
            VStack(spacing: 16) {
                // Top Card with Pin Icon
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("LightGreen"))
                    .frame(height: 140)
                    .shadow(color: Color.white.opacity(0.7), radius: 8, x: -6, y: -6)
                    .shadow(color: Color.black.opacity(0.2), radius: 8, x: 6, y: 6)
                    .overlay(
                        VStack(spacing: 12) {
                            HStack {
                                Spacer().frame(width: 16)
                                Image(systemName: "mappin.and.ellipse")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.red)
                                
                                
                                Text("Your location")
                                    .font(.headline)
                                    .foregroundColor(Color("PrimaryGreen"))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            VStack(alignment: .leading, spacing: 6) {
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                    TextField("Route number", text: $viewModel.routeNumber)
                                        .disabled(true)
                                }
                                .padding(12)
                                .background(Color(UIColor.systemGray5))
                                .cornerRadius(12)
                            }
                            .padding(.horizontal, 16)
                        }
                    )
                    .padding(.horizontal)
                
                // Recent Routes
                Text("Recent Routes")
                    .font(.title3)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                
                ScrollView {
                    ForEach(viewModel.allRouteInfos) { route in
                        Button(action: {
                            viewModel.selectedRoute = route
                        }) {
                            Text(route.routeNumber)
                                .font(.body)
                                .foregroundColor(.primary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color(UIColor.systemGray5))
                                .cornerRadius(12)
                                .padding(.horizontal, 16)
                        }
                    }
                }
                .frame(height: 170)
                .clipped()
                
                ScrollView {
                    if viewModel.routeNumber.isEmpty {
                        Text("No searched values. Please select a Recent route")
                            .foregroundColor(.gray)
                            .padding(.top, 16)
                    } else {
                        ForEach(viewModel.filteredBusRoutes, id: \.self) { route in
                            NavigationLink(destination: DetailView(busID: route.id)) {
                                AvailableBusRow(bus: route)
                                    .padding(.horizontal, 16)
                            }
                        }
                    }
                }
                
                Spacer(minLength: 10)
            }
            .padding(.top)
            .navigationBarHidden(true)
            .onAppear {
                viewModel.loadTopRoutes()
            }
        }
    }
}

#Preview {
    SearchView()
}
