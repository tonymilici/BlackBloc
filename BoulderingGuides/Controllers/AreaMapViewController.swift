//
//  MapViewController.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/5/17.
//  Copyright © 2017 Black Bloc Apps. All rights reserved.
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:

//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

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

        mapView.delegate = self
        
        for cluster in (_area?.clusters)! {
            let circ = MKCircle(center: cluster.center!, radius: cluster.radius!)
            mapView.addOverlay(circ)
        }

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(gestureRecognizer:)))
        mapView.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func handleTap(gestureRecognizer: UIGestureRecognizer) {
        let tapPoint = gestureRecognizer.location(in: mapView)
        for cluster in (_area?.clusters)! {
            let tapCoord = (mapView as MKMapView).convert(tapPoint, toCoordinateFrom: mapView)
            let mp1 = MKMapPoint.init(tapCoord)
            let mp2 = MKMapPoint.init(cluster.center!)
            let dist = mp1.distance(to: mp2)
            if dist < cluster.radius! {
                navigationController?.pushViewController(ClusterViewController(cluster: cluster), animated: true)
                break
            }
        }
    }
}

extension AreaMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circle = MKCircleRenderer(overlay: overlay)
        circle.fillColor = UIColor.blue
        circle.strokeColor = UIColor.blue
        circle.alpha = 0.3
        circle.lineWidth = 1
        return circle
    }
}
