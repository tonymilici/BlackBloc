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

class AreaMapViewController: MapViewController {
    private var _area: Area?
    
    public init(area: Area) {
        super.init(location: area.location!, size: area.size!)
        _area = area
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []

        mapView.delegate = self
        
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

extension AreaMapViewController: MKMapViewDelegate {
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
