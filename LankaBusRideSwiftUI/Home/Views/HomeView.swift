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
        VStack {
            if let user = viewModel.user {
                Text("Welcome, \(user.name)")
                    .font(.title2)
            }
            
            List(viewModel.routes, id: \.id) { route in
                Text(route.title)
            }
        }
        .onAppear {
            viewModel.loadData()
        }
    }
}

#Preview {
    HomeView()
}
