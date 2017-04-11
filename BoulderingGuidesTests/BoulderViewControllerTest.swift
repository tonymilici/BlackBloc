//
//  BoulderViewControllerTest.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/11/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import XCTest
@testable import BoulderingGuides

class BoulderViewControllerTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_tableView_CellForRowAt() {
        let boulder = Boulder(name: "Black Bloc")
        let route = Route(name: "name")
        route.rating = "V17"
        route.stars = 4
        boulder.routes.append(route)
        let controller = BoulderViewController(boulder: boulder)
        
        let cell = controller.tableView(UITableView(), cellForRowAt: IndexPath(row: 0, section: 0))
        
        let text = "V17  \u{2605}\u{2605}\u{2605}\u{2605}"
        XCTAssertEqual(cell.detailTextLabel?.text, text)
    }
}
