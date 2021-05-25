//
//  RouteTest.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/11/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import XCTest
@testable import BoulderingGuide

class RouteTest: XCTestCase {
    func test_getStars() {
        let route1 = Route(
            name: "name",
            description: nil,
            rating: "VB",
            stars: 0,
            image: nil,
            location: nil)
        
        XCTAssertEqual(route1.getStars, "")
        
        let route2 = Route(
            name: "name",
            description: "",
            rating: "VB",
            stars: 1,
            image: nil,
            location: nil)
        
        XCTAssertEqual(route2.getStars, "\u{2605}")
    }
}
