//
//  SearchViewModel.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-14.
//

import Foundation

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var error: Error?
    
    @Published var allRouteInfos: [RouteInfo] = []
    @Published var allBusRoutes: [BusRoute] = []
    @Published var filteredBusRoutes: [BusRoute] = []
    @Published var selectedRoute: RouteInfo? {
        didSet { handleRouteSelection() }
    }
    @Published var routeNumber: String = "" {
        didSet { filterRoutes() }
    }
    
    private let busRepository: BusRepositoryProtocol
    
    init(busRepository: BusRepositoryProtocol = BusRepository()) {
        self.busRepository = busRepository
    }
    
    func loadTopRoutes(limit: Int = 5) {
        isLoading = true
        busRepository.fetchRoutes { [weak self] isSuccess, routes, error in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.isLoading = false
                if isSuccess, let routes = routes {
                    let uniqueRoutes = Array(Set(routes.map { RouteInfo(routeNumber: $0.routeNumber) }))
                    self.allRouteInfos = Array(uniqueRoutes.prefix(limit))
                    self.allBusRoutes = routes
                } else {
                    self.error = error ?? NetworkError.defaultError
                    self.allRouteInfos = []
                    self.allBusRoutes = []
                }
                self.filterRoutes()
            }
        }
    }
    
    private func handleRouteSelection() {
        routeNumber = selectedRoute?.routeNumber ?? ""
    }
    
    private func filterRoutes() {
        if let route = selectedRoute {
            filteredBusRoutes = allBusRoutes.filteredByRoute(by: route)
        } else {
            filteredBusRoutes = []
        }
    }
}
