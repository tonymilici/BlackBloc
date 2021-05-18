//
//  AreaMapPage.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 5/17/21.
//  Copyright © 2021 Imortal Apps. All rights reserved.
//

import SwiftUI
import MapKit

struct AreaMapPage: UIViewRepresentable {
    let area: Area
    
    private let metersPerMile = 1609.344
    
    func makeUIView(context: Context) -> UIView {
        let mapView = MKMapView()
        
        mapView.mapType = .satellite
        mapView.showsUserLocation = true
        
        let center = CLLocationCoordinate2D(latitude: area.location.latitude, longitude: area.location.longitude)
        let region = mapView.regionThatFits(MKCoordinateRegion.init(center: center, latitudinalMeters: area.size*metersPerMile, longitudinalMeters: area.size*metersPerMile))
        
        mapView.region = region
        
        let tapRecognizer = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap(gestureRecognizer:)))
            mapView.addGestureRecognizer(tapRecognizer)
        
        for cluster in area.clusters {
            let circ = MKCircle(center: cluster.centerLoc, radius: cluster.radius)
            mapView.addOverlay(circ)
        }
        
        mapView.delegate = context.coordinator
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let circle = MKCircleRenderer(overlay: overlay)
            circle.fillColor = UIColor.blue
            circle.strokeColor = UIColor.blue
            circle.alpha = 0.3
            circle.lineWidth = 1
            return circle
        }
        
        @objc func handleTap(gestureRecognizer: UIGestureRecognizer) {
            print("tapped")
        }
    }
}

struct AreaMapPage_Previews: PreviewProvider {
    static var previews: some View {
        AreaMapPage(area: Areas().getArea(index: 0))
    }
}
