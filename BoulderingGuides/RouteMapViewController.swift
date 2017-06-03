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

/*class RouteAnnotation: MKAnnotation {
    
}*/

class RouteMapViewController: UIViewController {
    @IBOutlet var _mapView: MKMapView!
    private let _metersPerMile = 1609.344
    private var _location: Location?
    
    public init(location: Location) {
        super.init(nibName: "MapView", bundle: nil)
        self._location = location
        
 /*       let ann = RouteAnnotation()
        self.mapView.addAnnotation(ann as! MKAnnotation)*/
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
        
        let center = CLLocationCoordinate2D(latitude: (_location?.latitude)!, longitude: (_location?.longitude)!)
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

