//
//  MapView.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 5/18/21.
//  Copyright © 2021 BlackBloc Software. All rights reserved.
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE./

import Foundation
import SwiftUI
import MapKit

struct AreaMapView: UIViewRepresentable {
    let area: Area
    let mapView = MKMapView()
    var tapCallback: ((Int) -> Void)
   
    func makeUIView(context: Context) -> UIView {
        mapView.mapType = .satellite
        mapView.showsUserLocation = true
       
        let metersPerMile = 1609.344
        let center = CLLocationCoordinate2D(latitude: area.location.latitude, longitude: area.location.longitude)
        let region = MKCoordinateRegion.init(
            center: center,
            latitudinalMeters: area.size * metersPerMile,
            longitudinalMeters: area.size * metersPerMile)
        
        mapView.region = mapView.regionThatFits(region)
       
        let tapRecognizer = UITapGestureRecognizer(
            target: context.coordinator,
            action: #selector(context.coordinator.handleTap(gestureRecognizer:)))
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
        Coordinator(self)
    }
   
    class Coordinator: NSObject, MKMapViewDelegate {
        let parent: AreaMapView
       
        init(_ parent: AreaMapView) {
            self.parent = parent
            super.init()
        }
       
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let circle = MKCircleRenderer(overlay: overlay)
            circle.fillColor = UIColor.red
            circle.strokeColor = UIColor.red
            circle.alpha = 0.3
            circle.lineWidth = 1
            return circle
        }
       
        @objc func handleTap(gestureRecognizer: UIGestureRecognizer) {
            let tapPoint = gestureRecognizer.location(in: parent.mapView)
            for cluster in parent.area.clusters {
                let tapCoord = parent.mapView.convert(tapPoint, toCoordinateFrom: parent.mapView)
                let mp1 = MKMapPoint(tapCoord)
                let mp2 = MKMapPoint(cluster.centerLoc)
                let dist = mp1.distance(to: mp2)
                if dist < cluster.radius {
                    if let index = parent.area.clusters.firstIndex(of: cluster) {
                        parent.tapCallback(index)
                        break
                    }
                }
            }
        }
    }
}
