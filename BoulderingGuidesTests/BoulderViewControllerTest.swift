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
    func test_tableView_CellForRowAt() {
        var route = Route(name: "name")
        route.rating = "V17"
        route.stars = 4
        
        let boulder = Boulder(
            name: "Black Bloc",
            description: "",
            routes: [route],
            image: "",
            location: Location(latitude: 0, longitude: 0))
        
        let controller = BoulderViewController(boulder: boulder)
        
        let cell = controller.tableView(UITableView(), cellForRowAt: IndexPath(row: 0, section: 0))
        
        let text = "V17  \u{2605}\u{2605}\u{2605}\u{2605}"
        XCTAssertEqual(cell.detailTextLabel?.text, text)
    }
}
