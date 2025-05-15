//
//  SearchViewModelTests.swift
//  LankaBusRideSwiftUITests
//
//  Created by ranCreation on 2025-05-15.
//

import XCTest
@testable import LankaBusRideSwiftUI

final class SearchViewModelTests: XCTestCase {
    
    var viewModel: SearchViewModel!
    var mockRepository: MockBusRepository!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockBusRepository()
        viewModel = SearchViewModel(busRepository: mockRepository)
    }
    
    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        super.tearDown()
    }
    
    func testLoadTopRoutesSuccess() {
        let expectedRoutes = [
            BusRoute(id: 1, companyName: "Mock Co", source: "A", destination: "B", departure: "6:00", arrival: "9:00", routeNumber: "MOCK1", duration: "3h"),
            BusRoute(id: 2, companyName: "Mock Co2", source: "A2", destination: "B2", departure: "7:00", arrival: "10:00", routeNumber: "MOCK2", duration: "4h"),
            BusRoute(id: 3, companyName: "Mock Co3", source: "A3", destination: "B3", departure: "6:00", arrival: "9:00", routeNumber: "MOCK1", duration: "3h"),
        ]
        mockRepository.fetchRoutesResult = (true, expectedRoutes, nil)
        
        let expectation = self.expectation(description: "loadTopRoutes")
        
        viewModel.loadTopRoutes(limit: 2)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertFalse(self.viewModel.isLoading)
            XCTAssertNil(self.viewModel.error)
            XCTAssertEqual(self.viewModel.allRouteInfos.count, 2)
            XCTAssertEqual(self.viewModel.allRouteInfos.map { $0.routeNumber }.sorted(), ["MOCK1", "MOCK2"])
            XCTAssertEqual(self.viewModel.allBusRoutes.count, expectedRoutes.count)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testLoadTopRoutesFailure() {
        mockRepository.fetchRoutesResult = (false, nil, NetworkError.defaultError)
        
        let expectation = self.expectation(description: "loadTopRoutesFailure")
        
        viewModel.loadTopRoutes(limit: 3)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertFalse(self.viewModel.isLoading)
            XCTAssertNotNil(self.viewModel.error)
            XCTAssertEqual(self.viewModel.allRouteInfos.count, 0)
            XCTAssertEqual(self.viewModel.allBusRoutes.count, 0)
            XCTAssertEqual(self.viewModel.filteredBusRoutes.count, 0)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testSelectingRouteUpdatesRouteNumberAndFilters() {
        let expectedRoutes = [
            BusRoute(id: 1, companyName: "Mock Co", source: "A", destination: "B", departure: "6:00", arrival: "9:00", routeNumber: "MOCK1", duration: "3h"),
            BusRoute(id: 2, companyName: "Mock Co2", source: "A2", destination: "B2", departure: "7:00", arrival: "10:00", routeNumber: "MOCK2", duration: "4h")
        ]
        viewModel.allBusRoutes = expectedRoutes
        viewModel.selectedRoute = RouteInfo(routeNumber: "MOCK1")
        
        XCTAssertEqual(viewModel.routeNumber, "MOCK1")
        XCTAssertEqual(viewModel.filteredBusRoutes.count, 1)
        XCTAssertEqual(viewModel.filteredBusRoutes.first?.routeNumber, "MOCK1")
    }
    
    func testSettingRouteNumberTriggersFilter() {
        let route = RouteInfo(routeNumber: "MOCK1")
        let expectedRoutes = [
            BusRoute(id: 1, companyName: "Mock Co", source: "A", destination: "B", departure: "6:00", arrival: "9:00", routeNumber: "MOCK1", duration: "3h"),
            BusRoute(id: 2, companyName: "Mock Co2", source: "A2", destination: "B2", departure: "7:00", arrival: "10:00", routeNumber: "MOCK2", duration: "4h")
        ]
        viewModel.allBusRoutes = expectedRoutes
        viewModel.selectedRoute = route
        
        // Change routeNumber manually, should call filterRoutes
        viewModel.routeNumber = "MOCK1"
        
        XCTAssertEqual(viewModel.filteredBusRoutes.count, 1)
        XCTAssertEqual(viewModel.filteredBusRoutes.first?.routeNumber, "MOCK1")
    }
    
}
