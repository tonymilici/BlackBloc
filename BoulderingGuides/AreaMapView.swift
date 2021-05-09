//
//  AreaMapView.swift
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

struct AreaMapView: View {
    let area: Area

    @State var dragLocation: CGPoint?
    @State var tapLocation: CGPoint?

    @State var selectedClusterIndex: Int? = nil
    
    private let metersPerMile = 1609.344
    
    var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: area.location.latitude,
                longitude: area.location.longitude),
            latitudinalMeters: area.size * metersPerMile,
            longitudinalMeters: area.size * metersPerMile)
    }
    
    var body: some View {
        let mapView = MapViewUIKit(region: region)

        for cluster in area.clusters {
            let circ = MKCircle(center: cluster.centerLoc, radius: cluster.radius)
            mapView.addOverlay(circle: circ)
        }
        
        let tap = TapGesture()
            .onEnded {
                handleTap(tapPoint: dragLocation!, mapView: mapView)
            }
        
        let drag = DragGesture(minimumDistance: 0)
            .onChanged { value in
                dragLocation = value.location
            }
            .sequenced(before: tap)
        
        return ZStack {
            mapView.gesture(drag)
            
            ForEach(0 ..< area.clusters.count) {index in NavigationLink(destination: ClusterPage(cluster: area.clusters[index]), tag: index, selection: $selectedClusterIndex) {
                    EmptyView()
                }
            }
        }
    }
    
    func handleTap(tapPoint: CGPoint, mapView: MapViewUIKit) {
        let tapCoord = mapView.convert(point: tapPoint)
        let mp1 = MKMapPoint.init(tapCoord)
        
        for cluster in area.clusters {
            let mp2 = MKMapPoint.init(cluster.centerLoc)
            let dist = mp1.distance(to: mp2)
            if dist < cluster.radius {
                selectedClusterIndex = area.clusters.firstIndex(of: cluster)
                break
            }
        }
    }
}

struct AreaMapView_Previews: PreviewProvider {
    static var previews: some View {
        AreaMapView(area: Areas().getArea(index: 0))
    }
}
