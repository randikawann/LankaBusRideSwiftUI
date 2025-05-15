//
//  HomeViewModelTests.swift
//  LankaBusRideSwiftUITests
//
//  Created by ranCreation on 2025-05-12.
//

import Foundation
import XCTest
@testable import LankaBusRideSwiftUI

final class HomeViewModelTests: XCTestCase {
    
    
    var viewModel: HomeViewModel!
    var mockBusRepository: MockBusRepository!
    var mockUserRepository: MockUserRepository!
    
    override func setUp() {
        super.setUp()
        mockBusRepository = MockBusRepository()
        mockUserRepository = MockUserRepository()
        viewModel = HomeViewModel(userRepository: mockUserRepository, busRepository: mockBusRepository)
    }
    
    override func tearDown() {
        viewModel = nil
        mockBusRepository = nil
        mockUserRepository = nil
        super.tearDown()
    }
    

    func test_loadData_setsUserAndRoutes() {
        // Arrange
        let expectedUser = User(id: 1, name: "Test User", email: "randika@email.com", profilePictureURL: "")
        let expectedRoutes = [
            BusRoute(id: 1, companyName: "Mock Co", source: "A", destination: "B", departure: "6:00", arrival: "9:00", routeNumber: "MOCK1", duration: "3h")
        ]
        mockUserRepository.mockUser = expectedUser

        mockBusRepository.fetchRoutesResult = (true, expectedRoutes, nil)

        let expectationUser = expectation(description: "User loaded")
        let expectationRoutes = expectation(description: "Routes loaded")

        // Act
        viewModel.loadData()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if self.viewModel.user != nil { expectationUser.fulfill() }
            if !self.viewModel.routes.isEmpty { expectationRoutes.fulfill() }
        }

        // Assert
        wait(for: [expectationUser, expectationRoutes], timeout: 1.0)

        XCTAssertEqual(viewModel.user?.name, expectedUser.name)
        XCTAssertEqual(viewModel.routes.count, expectedRoutes.count)
    }
}
