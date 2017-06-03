//
//  RouteMapViewController.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 6/3/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class Annotation: NSObject, MKAnnotation {
    public var coordinate: CLLocationCoordinate2D
    public var title: String?
    public var subtitle: String?
    
    public init(location: Location, title: String) {
        let location = location
        coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        self.title = title
    }
}

class NavigationMapViewController: MapViewController {
    private var name: String?
    
    public init(location: Location?, size: Double, name: String?) {
        super.init(location: location!, size: size)
        self.name = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let ann = Annotation(location: _location!, title: name!)
        self.mapView.addAnnotation(ann as MKAnnotation)
    }
}

