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

}
