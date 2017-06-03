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

class RouteAnnotation: NSObject, MKAnnotation {
    public var coordinate: CLLocationCoordinate2D
    public var title: String?
    public var subtitle: String?
    
    public init(route: Route) {
        let location = (route.location)!
        coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        title = route.name
    }
}

class RouteMapViewController: UIViewController {
    @IBOutlet var _mapView: MKMapView!
    private let _metersPerMile = 1609.344
    private var _route: Route?
    
    public init(route: Route) {
        super.init(nibName: "MapView", bundle: nil)
        self._route = route
        
        let ann = RouteAnnotation(route: _route!)
        self.mapView.addAnnotation(ann as MKAnnotation)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var mapView: MKMapView {
        get {
            return _mapView
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        
        mapView.delegate = self
        mapView.mapType = .satellite
        
        let location = (_route?.location)!
        let center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let region = mapView.regionThatFits(MKCoordinateRegionMakeWithDistance(center, 0.01*_metersPerMile, 0.01*_metersPerMile))
        
        mapView.region = region
    }
}

extension RouteMapViewController: MKMapViewDelegate {
  /*  func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let ov = overlay as? MKCircle
        print("circle. center: \(overlay.coordinate)")
        print("circle. radius: \(String(describing: ov?.radius))")
        let circle = MKCircleRenderer(overlay: overlay)
        circle.fillColor = UIColor.blue
        circle.strokeColor = UIColor.blue
        circle.alpha = 0.3
        circle.lineWidth = 1
        return circle
        
    }*/
}

