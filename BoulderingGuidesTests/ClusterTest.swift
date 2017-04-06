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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_init() {
        let cluster = Cluster(centerX: 34.2, centerY: -118.6, radius: 100)
        
        XCTAssertEqual(cluster.center?.latitude, 34.2)
        XCTAssertEqual(cluster.center?.longitude, -118.6)
        XCTAssertEqual(cluster.radius, 100)
    }
    
}
