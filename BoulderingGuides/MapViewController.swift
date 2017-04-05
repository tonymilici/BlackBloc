//
//  MapViewController.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/5/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController {
    private var _area: Area?
    private let _metersPerMile = 1609.344
    
    public init(area: Area) {
        super.init(nibName: "MapView", bundle: nil)
        _area = area
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        let mapView = view as! MKMapView
        mapView.mapType = .satellite
        
        let center = CLLocationCoordinate2D(latitude: (_area?.location?.latitude)!, longitude: (_area?.location?.longitude)!)
        let region = mapView.regionThatFits(MKCoordinateRegionMakeWithDistance(center, 0.2*_metersPerMile, 0.2*_metersPerMile))
        
        mapView.region = region
        
        
        mapView.centerCoordinate = center
        
    }
    
}
