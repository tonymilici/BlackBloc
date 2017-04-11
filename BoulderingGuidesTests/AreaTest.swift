//
//  AreaTest.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/11/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import XCTest
@testable import BoulderingGuides

class AreaTest: XCTestCase {
    func test_getRoutes() {
        let areas = Area(name: "Horse Flats")
        
        let routes = areas.getRoutes()
        
        XCTAssertNotNil(routes)
    }
    
}
