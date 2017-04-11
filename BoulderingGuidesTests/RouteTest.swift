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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_getStars() {
        var route = Route(name: "name")
        XCTAssertEqual(route.getStars(), "")
        
        let stars1 = "\u{2605}"
        route.stars = 1
        
        XCTAssertEqual(route.getStars(), stars1)
    }
}
