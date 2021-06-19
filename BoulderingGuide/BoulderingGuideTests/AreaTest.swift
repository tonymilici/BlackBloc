//
//  AreaTest.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/11/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import XCTest
@testable import BoulderingGuide

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
        
        XCTAssertNotNil(area.routes)
        XCTAssertEqual(area.routes.count, 1)
    }
    
    func test_Images() {
        let route1 = Route(
            name: "Hardest Route in the World",
            description: "",
            rating: "V18",
            stars: nil,
            image: "hot_pic.jpg",
            location: nil)
        
        let route2 = Route(
            name: "Easiest Route in the World",
            description: "",
            rating: "VB",
            stars: nil,
            image: nil,
            location: nil)
        
        let boulder1 = Boulder(
            name: "",
            description: nil,
            routes: [route1, route2],
            image: nil,
            location: nil)
        
        let boulder2 = Boulder(
            name: "",
            description: nil,
            routes: [route1, route2],
            image: "boulder_pic.jpg",
            location: nil)
        
        let cluster = Cluster(
            location: Location(latitude: 0, longitude: 0),
            radius: 0,
            name: "Fuck",
            boulders: [boulder1, boulder2])

        let area = Area(
            name: "Horse Flats",
            location: Location(latitude: 33.9873, longitude: -117.3899),
            size: 10, clusters: [cluster])
        
        let images = area.images
        XCTAssertNotNil(images)
        XCTAssertTrue(images.count > 0)
        XCTAssertTrue(images.contains { $0 == "hot_pic.jpg" })
        XCTAssertTrue(images.contains { $0 == "boulder_pic.jpg" })
    }
    
}
