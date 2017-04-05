//
//  Area.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/4/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import Foundation

public struct Location {
    public var latitude: Double
    public var longitude: Double
}

public class Area {
    public var name = ""
    public var location: Location?
    
    init(name: String) {
        self.name = name
    }
}
