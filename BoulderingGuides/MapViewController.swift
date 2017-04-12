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
    @IBOutlet var _mapView: MKMapView!
    private let _metersPerMile = 1609.344
    
    public init(area: Area) {
        super.init(nibName: "MapView", bundle: nil)
        _area = area
        title = _area?.name
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
        
        let center = CLLocationCoordinate2D(latitude: (_area?.location?.latitude)!, longitude: (_area?.location?.longitude)!)
        let region = mapView.regionThatFits(MKCoordinateRegionMakeWithDistance(center, (_area?.size)!*_metersPerMile, (_area?.size)!*_metersPerMile))
        
        mapView.region = region
        
        for cluster in (_area?.clusters)! {
            let circ = MKCircle(center: cluster.center!, radius: cluster.radius!)
            mapView.add(circ)
        }

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(gestureRecognizer:)))
        mapView.addGestureRecognizer(tapRecognizer)
    }
    
    func handleTap(gestureRecognizer: UIGestureRecognizer) {
        let tapPoint = gestureRecognizer.location(in: mapView)
        for cluster in (_area?.clusters)! {
            let cent = mapView.convert(cluster.center!, toPointTo: mapView)
            let dist = pow(tapPoint.x - cent.x, 2.0) + pow(tapPoint.y - cent.y, 2.0)
            if dist < CGFloat(pow (cluster.radius!, 2.0)) {
                navigationController?.pushViewController(ClusterViewController(cluster: cluster), animated: true)
            }
        }
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
        circle.lineWidth = 1
        return circle
     
    }
}

extension MapViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
    }
}
