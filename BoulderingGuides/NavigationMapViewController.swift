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
        
        mapView.delegate = self
        
        let ann = Annotation(location: _location!, title: name!)
        self.mapView.addAnnotation(ann as MKAnnotation)
    }
}

extension NavigationMapViewController: MKMapViewDelegate {
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

