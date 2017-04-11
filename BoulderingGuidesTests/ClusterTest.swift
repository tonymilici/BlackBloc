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
        let cluster = Cluster(name: "Boulder 1 Area", centerX: 34.2, centerY: -118.6, radius: 100)
        
        XCTAssertEqual(cluster.center?.latitude, 34.2)
        XCTAssertEqual(cluster.center?.longitude, -118.6)
        XCTAssertEqual(cluster.radius, 100)
    }
    
}
