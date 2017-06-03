//
//  MapViewController.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 6/3/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet var _mapView: MKMapView!
    private let _metersPerMile = 1609.344
    public var _location: Location?
    public var _size = 0.0
    
    public init(location: Location, size: Double) {
        super.init(nibName: "MapView", bundle: nil)
        self._location = location
        self._size = size
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var mapView: MKMapView {
        get {
            return _mapView
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        
        mapView.mapType = .satellite
        mapView.showsUserLocation = true
        
        let center = CLLocationCoordinate2D(latitude: (_location?.latitude)!, longitude: (_location?.longitude)!)
        let region = mapView.regionThatFits(MKCoordinateRegionMakeWithDistance(center, _size*_metersPerMile, _size*_metersPerMile))
        
        mapView.region = region
    }
}
