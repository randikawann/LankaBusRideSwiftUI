//
//  HomeView.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-10.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    if let user = viewModel.user {
                        Text("Hi, \(user.name)")
                            .font(.title2)
                    }
                    Image("profile")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.leading, 8)
                }
                .padding()
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color("LightGreen"))
                    .frame(height: 100)
                    .overlay(
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Travel at your own convience")
                                    .foregroundColor(Color("PrimaryGreen"))
                                Button(action: {}) {
                                    Text("Search Now")
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color("PrimaryGreen"))
                                        .cornerRadius(8)
                                }
                            }
                            Spacer()
                            Image("travel_girl")
                                .resizable()
                                .frame(width: 100, height: 100)
                        }
                            .padding()
                    )
                    .padding(.all, 16)
                    .shadow(color: .gray.opacity(0.4), radius: 6, x: 0, y: 4)
                
                HStack {
                    Text("Available Buses")
                        .font(.title3)
                        .bold()
                    Spacer()
                    NavigationLink("See All", destination: Text("All Buses"))
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(viewModel.routes) { bus in
                            NavigationLink(destination: DetailView(busID: bus.id)) {
                                AvailableBusRow(bus: bus)
                            }
                        }
                    }
                    .padding()
                }
                
                Spacer()
            }
        }.onAppear {
            viewModel.loadData()
        }
    }
}

#Preview {
    HomeView()
}
