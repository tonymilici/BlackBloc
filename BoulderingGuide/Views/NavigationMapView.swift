//
//  NavigationMapView.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 5/22/21.
//  Copyright © 2021 BlackBloc Software. All rights reserved.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE./

import SwiftUI
import MapKit

struct NavigationMapView: UIViewRepresentable {
    let mapView = MKMapView()
    let location: Location
    
    func makeUIView(context: Context) -> UIView {
        mapView.mapType = .satellite
        mapView.showsUserLocation = true
        
        let size = 160.9344
        let center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let region = MKCoordinateRegion.init(
            center: center,
            latitudinalMeters: size,
            longitudinalMeters: size)
        
        mapView.region = mapView.regionThatFits(region)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        mapView.addAnnotation(annotation)
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
       
    }
}
