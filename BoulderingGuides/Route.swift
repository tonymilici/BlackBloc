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
    
    public init(name: String) {
        self.name = name
    }
    
    public func getStars() -> String {
        let starChar = "\u{2605}"
        var star = ""
        if stars > 0 {
            star += starChar
        }
        if stars > 1 {
            star += starChar
        }
        if stars > 2 {
            star += starChar
        }
        if stars > 3 {
            star += starChar
        }
        return star
    }
}
