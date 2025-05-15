//
//  DetailViewModelTests.swift
//  LankaBusRideSwiftUITests
//
//  Created by ranCreation on 2025-05-15.
//

import XCTest
@testable import LankaBusRideSwiftUI

final class DetailViewModelTests: XCTestCase {

    var viewModel: DetailViewModel!
    var mockRepository: MockBusRepository!

    override func setUp() {
        super.setUp()
        mockRepository = MockBusRepository()
        viewModel = DetailViewModel(busRepository: mockRepository)
    }

    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        super.tearDown()
    }

    func testLoadBusDetailSuccess() {
        // Arrange
        let sampleDetail = BusDetail(id: 1, title: "Colombo to Galle", companyName: "mockcompany", source: "Colombo", destination: "Galle", departure: "07:00 AM", arrival: "10:00 AM", routeNumber: "98", duration: "3h", popularStops: ["Panadura", "Aluthgama", "Hikkaduwa"], fare: 450, busType: "Express")
        
        mockRepository.fetchBusDetailsResult = (true, sampleDetail, nil)
        let expectation = XCTestExpectation(description: "Bus detail loaded")

        // Act
        viewModel.loadBusDetail(id: 1) {
            // Assert
            XCTAssertEqual(self.viewModel.title, "Colombo to Galle")
            XCTAssertEqual(self.viewModel.source, "Colombo")
            XCTAssertEqual(self.viewModel.destination, "Galle")
            XCTAssertEqual(self.viewModel.departure, "07:00 AM")
            XCTAssertEqual(self.viewModel.arrival, "10:00 AM")
            XCTAssertEqual(self.viewModel.routeNumber, "98")
            XCTAssertEqual(self.viewModel.busType, "Express")
            XCTAssertEqual(self.viewModel.duration, "3h")
            XCTAssertEqual(self.viewModel.fareText, "LKR 450")
            XCTAssertEqual(self.viewModel.popularStops, "Panadura, Aluthgama, Hikkaduwa")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func testLoadBusDetailFailure() {
        // Arrange
        mockRepository.fetchBusDetailsResult = (false, nil, .defaultError)
        let expectation = XCTestExpectation(description: "Bus detail load failed")

        // Act
        viewModel.loadBusDetail(id: 2) {
            // Assert
            XCTAssertNil(self.viewModel.busDetail)
            XCTAssertEqual(self.viewModel.title, "Bus Details")
            XCTAssertEqual(self.viewModel.source, "-")
            XCTAssertEqual(self.viewModel.fareText, "N/A")
            XCTAssertEqual(self.viewModel.popularStops, "-")
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
