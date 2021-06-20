//
//  RoutePage.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 5/2/21.
//  Copyright © 2021 Black Bloc Software. All rights reserved.
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
//SOFTWARE./

import SwiftUI

struct RoutePage: View {
    let route: Route
    
    @Environment(\.areaName) private var areaName: String
    @State private var isNavigateActive = false
    
    var body: some View {
        VStack(alignment: .center) {
            Text(route.name)
                .font(.headline)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
            
            Text("\(route.rating)  \(route.getStars)\n\n\(route.description!)")
                .font(.system(size: 14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
            
            Spacer()
            
            if let image = route.image {
                AsyncImage(imageSpec: ImageSpec(area: areaName, image: image))
            }
            
            if let location = route.location {
                NavigationLink(destination: NavigationPage(location: location, title: route.name), isActive: $isNavigateActive) {
                    EmptyView()
                }
            }
        }
        .padding(8)
        .toolbar {
            Button(action: { isNavigateActive = true }) {
                Image(systemName: "safari")
            }
            .disabled(route.location == nil)
        }
    }
}

struct RoutePage_Previews: PreviewProvider {
    static var previews: some View {
        if let area = try? Areas.loadArea("stoney_point.json") {
            RoutePage(route: area.routes[2])
                .environment(\.areaName, area.name)
        }
    }
}
