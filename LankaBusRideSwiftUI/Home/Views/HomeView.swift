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
            VStack(alignment: .leading, spacing: 12) {
                // Top Greeting
                HStack {
                    VStack(alignment: .leading) {
                        if let user = viewModel.user {
                            Text("Hi, \(user.name)")
                                .font(.title3.bold())
                        }
                    }
                    Spacer()
                    Image("profile")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())
                }
                .padding(.horizontal)

                // Promo Banner
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color("LightGreen"))
                        .shadow(color: .gray.opacity(0.3), radius: 6, x: 0, y: 4)

                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Travel at your own convience")
                                .foregroundColor(Color("PrimaryGreen"))
                                .font(.subheadline)
                            
                            Button(action: {}) {
                                Text("Search Now")
                                    .font(.subheadline.bold())
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(Color("PrimaryGreen"))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }

                        Spacer()

                        Image("travel_girl")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 80)
                    }
                    .padding()
                }
                .frame(height: 110)
                .padding(.horizontal)

                // Header
                HStack {
                    Text("Available Buses")
                        .font(.title3.bold())
                    Spacer()
                    NavigationLink(destination: Text("All Buses")) {
                        Text("See All")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal)

                // Bus Cards
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(viewModel.routes) { bus in
                            NavigationLink(destination: DetailView(busID: bus.id)) {
                                AvailableBusRow(bus: bus)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                viewModel.loadData()
            }
        }
    }
}


#Preview {
    HomeView()
}
