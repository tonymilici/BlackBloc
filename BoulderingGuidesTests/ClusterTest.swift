//
//  ClusterTest.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/6/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import XCTest
@testable import BoulderingGuides

class ClusterTest: XCTestCase {
    func test_init() {
        let cluster = Cluster(location: Location(latitude: 34.2, longitude: -118.6), radius: 100, name: "", boulders: [])
        
        XCTAssertEqual(cluster.location.latitude, 34.2)
        XCTAssertEqual(cluster.location.longitude, -118.6)
        XCTAssertEqual(cluster.radius, 100)
    }
    
}
