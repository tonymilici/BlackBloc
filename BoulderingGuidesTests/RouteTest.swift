//
//  RouteTest.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/11/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import XCTest
@testable import BoulderingGuides

class RouteTest: XCTestCase {
    func test_getStars() {
        let route = Route(name: "name")
        XCTAssertEqual(route.getStars(), "")
        
        let stars1 = "\u{2605}"
        route.stars = 1
        
        XCTAssertEqual(route.getStars(), stars1)
    }
}
