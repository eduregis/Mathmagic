//
//  DispersionTests.swift
//  MathmagicTests
//
//  Created by Eduardo Oliveira on 26/07/21.
//

import XCTest
@testable import Mathmagic

class DispersionTests: XCTestCase {

    var sut = DispersionMeasures()
    
    func test_variance() {
        XCTAssertEqual(3.5, sut.variance([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]), accuracy: 0.0000001 )
    }
    
    func test_standard_deviation() {
        XCTAssertEqual(1.870828693, sut.standardDeviation([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]), accuracy: 0.0000001 )
    }
    
    func test_covariance() {
        XCTAssertEqual(5.25, sut.covariance([1.0, 2.0, 3.0, 4.0, 5.0], [2.0, 3.0, 5.0, 8.0, 10.0]), accuracy: 0.0000001 )
    }
    
    func test_covariance_diferent_sizes() {
        XCTAssertNoThrow(try sut.covariance([7.0, 6.0, 8.0, 7.5], [1, 2, 3]))
    }
    
    func test_covariance_empty_arrays() {
        XCTAssertNoThrow((try sut.covariance([], [])))
    }
    
    func test_correlation() {
        XCTAssertEqual(0.9877569118, sut.correlation([1.0, 2.0, 3.0, 4.0, 5.0], [2.0, 3.0, 5.0, 8.0, 10.0]), accuracy: 0.0000001 )
    }
    
    func test_correlation_diferent_sizes() {
        XCTAssertNoThrow(try sut.correlation([7.0, 6.0, 8.0, 7.5], [1, 2, 3]))
    }
    
    func test_correlation_empty_arrays() {
        XCTAssertNoThrow((try sut.correlation([], [])))
    }
}
