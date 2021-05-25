//
//  AreasTest.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/3/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import XCTest
@testable import BoulderingGuide

class AreasTest: XCTestCase {
    func testLoad() {
        let areas = Areas()
        
        XCTAssertTrue(areas.areas.count > 0)
        
        let area = areas.areas[0]
        XCTAssertNotNil(area.name)
        XCTAssertNotNil(area.location)
        XCTAssertTrue(area.clusters.count > 0)
        
        let cluster = area.clusters[0];
        XCTAssertNotNil(cluster.name)
        XCTAssertTrue(cluster.boulders.count > 0)
        
        let boulder = cluster.boulders[0]
        XCTAssertNotNil(boulder.name)
        XCTAssertNotNil(boulder.description)
        XCTAssertTrue(boulder.routes.count > 0)
        
        let route = boulder.routes[0]
        XCTAssertNotNil(route.name)
        XCTAssertNotNil(route.description)
        XCTAssertNotNil(route.rating)
        XCTAssertTrue(route.stars! >= 0)
        
        XCTAssertNotNil(route.image)
    }
}
