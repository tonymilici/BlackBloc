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
        let route = Route(
            name: "Hardest Route in the World",
            description: "",
            rating: "V18",
            stars: nil,
            image: nil,
            location: nil)
        
        let boulder = Boulder(
            name: "",
            description: nil,
            routes: [route],
            image: nil,
            location: nil)
        
        let cluster = Cluster(
            location: Location(latitude: 0, longitude: 0),
            radius: 0,
            name: "Fuck",
            boulders: [boulder])

        let area = Area(
            name: "Horse Flats",
            location: Location(latitude: 33.9873, longitude: -117.3899),
            size: 10, clusters: [cluster])
        
        let routes = area.getRoutes()
        
        XCTAssertNotNil(routes)
        XCTAssertEqual(routes.count, 1)
    }
    
}
