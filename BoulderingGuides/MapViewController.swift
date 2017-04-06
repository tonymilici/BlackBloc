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
        mapView.delegate = self
        mapView.mapType = .satellite
        
        let center = CLLocationCoordinate2D(latitude: (_area?.location?.latitude)!, longitude: (_area?.location?.longitude)!)
        let region = mapView.regionThatFits(MKCoordinateRegionMakeWithDistance(center, 0.2*_metersPerMile, 0.2*_metersPerMile))
        
        print("map center: \(center)")
        print("map region: \(region)")
        
        mapView.region = region
        
        for cluster in (_area?.clusters)! {
            let circ = MKCircle(center: cluster.center!, radius: cluster.radius!)
            print("circ center: \(circ.coordinate)")
            print("circ. radius: \(String(describing: circ.radius))")
            mapView.add(circ)
        }
        
      //  let circle1 = MKCircle(center: center, radius: 100)
      //  mapView.add(circle1)
    }
    
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let ov = overlay as? MKCircle
        print("circle. center: \(overlay.coordinate)")
        print("circle. radius: \(String(describing: ov?.radius))")
        let circle = MKCircleRenderer(overlay: overlay)
        circle.fillColor = UIColor.blue
        circle.strokeColor = UIColor.blue
        circle.alpha = 0.3
        return circle
     
    }
}
