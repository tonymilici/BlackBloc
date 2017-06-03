//
//  Route.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/7/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import Foundation

public class Route {
    public var name: String?
    public var description: String?
    public var rating: String?
    public var stars = -1
    public var image: String?
    public var location: Location?
    
    public init(name: String) {
        self.name = name
    }
    
    public func getStars() -> String {
        var star = ""
        if stars < 1 {
            return star
        }
        
        let starChar = "\u{2605}"
        for _ in 1...stars {
            star += starChar
        }

        return star
    }
}
