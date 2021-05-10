//
//  MapViewUIKit.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 5/8/21.
//  Copyright © 2021 BlackBloc Software. All rights reserved.
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

import SwiftUI
import MapKit

struct MapViewUIKit: UIViewRepresentable {
    let mapView = MKMapView()
    let area: Area
    
    func makeUIView(context: Context) -> MKMapView {
        let metersPerMile = 1609.344
        
        let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: area.location.latitude,
                    longitude: area.location.longitude),
                latitudinalMeters: area.size * metersPerMile,
                longitudinalMeters: area.size * metersPerMile)

        mapView.setRegion(region, animated: false)
        mapView.mapType = .satellite
        mapView.delegate = context.coordinator
        
        for cluster in area.clusters {
            let circle = MKCircle(center: cluster.centerLoc, radius: cluster.radius)
            mapView.addOverlay(circle)
        }
        
        return mapView
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
    }
    
    public func convert(point tapPoint: CGPoint) -> CLLocationCoordinate2D {
        mapView.convert(tapPoint, toCoordinateFrom: mapView)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewUIKit
        
        init(_ parent: MapViewUIKit) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let circle = MKCircleRenderer(overlay: overlay)
            circle.fillColor = UIColor.blue
            circle.strokeColor = UIColor.blue
            circle.alpha = 0.3
            circle.lineWidth = 1
            return circle
        }
    }
}
