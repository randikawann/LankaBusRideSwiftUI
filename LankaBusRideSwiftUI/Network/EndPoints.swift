//
//  EndPoints.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-10.
//

import Foundation

enum Endpoint {
    case getRoutes
    case getUserDetails
    
    var url: String {
        switch self {
        case .getRoutes:
            return "https://run.mocky.io/v3/c946052c-51b7-48ad-b757-e7b51512f55a"
        case .getUserDetails:
            return "https://run.mocky.io/v3/ca6dc778-ae2d-49db-bd65-11e4f0c2f2de"
        }
    }
}
