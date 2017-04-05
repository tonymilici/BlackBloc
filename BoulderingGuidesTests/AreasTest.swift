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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoad() {
        let areas = Areas()
        
        XCTAssertEqual(areas.count(), 2)
        
        let area = areas.getArea(index: 0)
        XCTAssertEqual(area.name, "Stoney Point")
        XCTAssertEqual(area.location?.latitude, 34.271)
    }
    
}
