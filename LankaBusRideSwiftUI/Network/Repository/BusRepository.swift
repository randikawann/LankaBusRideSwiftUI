//
//  BusRepository.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-10.
//

import Foundation

final class BusRepository: BusRepositoryProtocol {
    private let apiManager = APIManager.shared

    func fetchRoutes(completion: @escaping (Bool, [BusRoute]?, NetworkError?) -> Void) {
        apiManager.request(endpoint: .getRoutes) { (isSuccess: Bool, dtoList: [BusRouteDTO]?, error: NetworkError?) in
            if isSuccess, let dtoList = dtoList {
                let domainList = dtoList.map { $0.toDomain() }
                completion(true, domainList, nil)
            } else {
                completion(false, nil, error)
            }
        }
    }
    
    func fetchBusDetails(busRouteId: Int, completion: @escaping (Bool, BusDetail?, NetworkError?) -> Void) {
        apiManager.request(endpoint: .getRoutes) { (isSuccess: Bool, dtoList: [BusRouteDTO]?, error: NetworkError?) in
            if isSuccess, let dtoList = dtoList {
                let domainList = dtoList.map { $0.toDomainDetail() }
                let busDetail = domainList.first { $0.id == busRouteId }
                completion(true, busDetail, nil)
            } else {
                completion(false, nil, error)
            }
        }
    }
}
