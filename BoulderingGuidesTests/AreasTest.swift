//
//  AreasTest.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/3/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import XCTest
@testable import BoulderingGuides

class AreasTest: XCTestCase {
    func testLoad() {
        let areas = Areas()
        
        XCTAssertEqual(areas.count(), 2)
        
        let area = areas.getArea(index: 0)
        XCTAssertEqual(area.name, "Stoney Point")
        XCTAssertEqual(area.location?.latitude, 34.271)
        XCTAssertTrue(area.clusters.count > 0)
        
        let cluster = area.clusters[0];
        XCTAssertEqual(cluster.name, "Boulder 1 Area")
        XCTAssertTrue(cluster.boulders.count > 0)
        
        let boulder = cluster.boulders[0]
        XCTAssertEqual(boulder.name, "Boulder 1")
        XCTAssertNotNil(boulder.description)
        XCTAssertTrue(boulder.routes.count > 0)
        
        let route = boulder.routes[0]
        XCTAssertNotNil(route.name)
        XCTAssertNotNil(route.description)
        XCTAssertNotNil(route.rating)
        XCTAssertTrue(route.stars >= 0)
        
       // XCTAssertNotNil(route.image)
    }
}
