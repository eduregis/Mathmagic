//
//  MathmagicTests.swift
//  MathmagicTests
//
//  Created by Eduardo Oliveira on 20/07/21.
//

import XCTest
@testable import Mathmagic

class MathmagicTests: XCTestCase {
    var sut = CentralTrendMeasures()
    
    func test_init_processRequest() {
        XCTAssertTrue( "processRequest" == sut.processRequest("teste"),
                       "String equality test failed, processRequest != \(sut.processRequest("teste") ?? "Wrong value")" )
    }
    
    func test_mean() {
        XCTAssertTrue(3.0 == sut.mean([2.0, 1.0, 6.0]),
                      "String equality test failed, processRequest != \(sut.mean([2.0, 1.0, 6.0]))" )
    }
    
    func test_weightedMean() {
        XCTAssertTrue(7.3 == sut.weightedMean([7.0, 6.0, 8.0, 7.5], [1, 2, 3, 4]),
                      "String equality test failed, processRequest != \(sut.weightedMean([7.0, 8.0, 6.0, 7.5], [1, 2, 3, 4]))" )
    }
    
    func test_weightedMean_diferent_sizes() {
        XCTAssertNoThrow(try sut.weightedMean([7.0, 6.0, 8.0, 7.5], [1, 2, 3]))
    }
    
    func test_weightedMean_empty_arrays() {
        XCTAssertNoThrow((try sut.weightedMean([], [])))
    }
    
    func test_geometricMean() {
        XCTAssertTrue(12.0 == sut.geometricMean([3.0, 12.0, 16.0, 36.0]),
                      "String equality test failed, processRequest != \(sut.geometricMean([3.0, 12.0, 16.0, 36.0]))" )
    }
    
    func test_median() {
        XCTAssertTrue(4.0 == sut.median([5.8, 6.0, 2.0, 1.5, 7.5, 2.2]),
                      "String equality test failed, processRequest != \(sut.median([5.8, 6.0, 2.0, 1.5, 7.5, 2.2]))" )
    }
    
    func test_mode_with_one_element() {
        XCTAssertTrue([1.0] == sut.mode([1.0, 1.0, 2.0, 1.0, 2.0, 1.0]),
                      "String equality test failed, processRequest != \(sut.mode([1.0, 1.0, 2.0, 1.0, 2.0, 1.0]))" )
    }
    
    func test_mode_with_multiple_element() {
        XCTAssertTrue([1.0, 2.0] == sut.mode([1.0, 2.0, 2.0, 1.0, 2.0, 1.0, 3.0]),
                      "String equality test failed, processRequest != \(sut.mode([1.0, 2.0, 2.0, 1.0, 2.0, 1.0, 3.0]))" )
    }
    
    func test_mode_with_multiple_element_ordened() {
        XCTAssertFalse([2.0, 1.0] == sut.mode([1.0, 2.0, 2.0, 1.0, 2.0, 1.0, 3.0]),
                       "String equality test failed, processRequest != \(sut.mode([1.0, 2.0, 2.0, 1.0, 2.0, 1.0, 3.0]))" )
    }
    
    func test_percentile() {
        XCTAssertEqual(8.4, sut.percentile([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0], 70), accuracy: 0.0000001 )
    }

    func test_quartile() {
        XCTAssertEqual(3.0, sut.quartile([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0], 1), accuracy: 0.0000001 )
    }
    
    func test_decile() {
        XCTAssertEqual(4.8, sut.decile([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0], 4), accuracy: 0.0000001 )
    }
}
