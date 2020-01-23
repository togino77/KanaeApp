//
//  KanaeAppTests.swift
//  KanaeAppTests
//
//  Created by OGINO Tetsuo on 2020/01/24.
//  Copyright © 2020 togino77.gmail.com. All rights reserved.
//

import XCTest
@testable import KanaeApp

class KanaeAppTests: XCTestCase {
    let manager = ApiManager.manager

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testManagerNotNil() {
        XCTAssertNotNil(manager)
    }
    
    func testApiCall() {
        let expectation: XCTestExpectation? = self.expectation(description: "call")
        
        let kanji = "今日はいい天気です"
        var query = ["output_type": "hiragana"]
        query["sentence"] = kanji
        manager.call(path: "hiragana", query: query, completionHandler: {(json, response, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(json)
            expectation?.fulfill()
        })
        self.waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testCallHiragana() {
        let expectation: XCTestExpectation? = self.expectation(description: "call")
        
        let kanji = "今日はいい天気です"
        manager.hiragana(sentence: kanji, completionHandler: {(converted, error) in
            XCTAssertNil(error)
            XCTAssertEqual(converted, "きょうは いい てんきです")
            expectation?.fulfill()
        })
        self.waitForExpectations(timeout: 5.0, handler: nil)

    }

}
