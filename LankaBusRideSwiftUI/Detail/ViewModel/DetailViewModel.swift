//
//  DetailViewModel.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-15.
//

import Foundation

final class DetailViewModel: ObservableObject {
    @Published var busDetail: BusDetail?
    
    var source: String {
        busDetail?.source ?? "-"
    }
    
    var destination: String {
        busDetail?.destination ?? "-"
    }
    
    var departure: String {
        busDetail?.departure ?? "-"
    }
    
    var arrival: String {
        busDetail?.arrival ?? "-"
    }
    
    var routeNumber: String {
        busDetail?.routeNumber ?? "-"
    }
    
    var busType: String {
        busDetail?.busType ?? "-"
    }
    
    var duration: String {
        busDetail?.duration ?? "-"
    }
    
    var fareText: String {
        if let fare = busDetail?.fare {
            return "LKR \(fare)"
        }
        return "N/A"
    }
    
    var popularStops: String {
        busDetail?.popularStops.joined(separator: ", ") ?? "-"
    }
    
    var title: String {
        busDetail?.title ?? "Bus Details"
    }
    
    private let busRepository: BusRepositoryProtocol
    
    init(
        busRepository: BusRepositoryProtocol = BusRepository()
    ) {
        self.busRepository = busRepository
    }
    
    func loadBusDetail(id: Int = 1, completion: @escaping () -> Void) {
        busRepository.fetchBusDetails(busRouteId: id) { [weak self] isSuccess, busDetail, error in
            DispatchQueue.main.async {
                if isSuccess, let busDetail = busDetail {
                    self?.busDetail = busDetail
                } else if error != nil {
//                    self?.didEncounterError?(error)
                } else {
//                    self?.didEncounterError?(NetworkError.defaultError)
                }
                completion()
            }
        }
    }
}
