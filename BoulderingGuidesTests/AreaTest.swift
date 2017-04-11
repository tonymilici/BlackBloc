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
        let route = Route(name: "Hardest Route in the World")
        let boulder = Boulder(name: "Black Bloc")
        boulder.routes.append(route)
        var cluster = Cluster(name: "Fuck", centerX: 0, centerY: 0, radius: 0)
        cluster.boulders.append(boulder)
        let area = Area(name: "Horse Flats")
        area.clusters.append(cluster)
        
        let routes = area.getRoutes()
        
        XCTAssertNotNil(routes)
        XCTAssertEqual(routes.count, 1)
    }
    
}
