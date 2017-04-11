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
    public var size: Double?
    public var clusters: [Cluster] = []
    
    init(name: String) {
        self.name = name
    }
    
    public func getRoutes() -> [Route] {
        var routes: [Route] = []
        
        for cluster in clusters {
            for boulder in cluster.boulders {
                for route in boulder.routes {
                    routes.append(route)
                }
            }
        }
        return routes
    }
}
