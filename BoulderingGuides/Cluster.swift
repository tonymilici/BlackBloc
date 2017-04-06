//
//  ClusterOverlay.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/5/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import Foundation
import MapKit

public struct Cluster {
    public var center: CLLocationCoordinate2D?
    public var radius: Double?
    public var name: String?
    
    public init(name: String, centerX: Double, centerY: Double, radius: Double)  {
        center = CLLocationCoordinate2D(latitude: centerX, longitude: centerY)
        self.radius = radius
        self.name = name
    }
}
