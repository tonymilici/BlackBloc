//
//  RoutesPage.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 5/17/21.
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
//SOFTWARE./

import SwiftUI

struct AreaListPage: View {
    @EnvironmentObject private var areaVM: AreaViewModel
    let listType: String
    
    var body: some View {
        List {
            switch listType {
            case "Routes":
                ForEach(areaVM.area.routes) {route in
                    NavigationLink(destination: RoutePage(route: route)) {
                        ListItemView(
                            item: ListItem(
                                label: route.name,
                                detail: "\(route.rating)  \(route.getStars)"))
                    }
                }
            case "Clusters":
                ForEach(areaVM.area.clusters) {cluster in
                    NavigationLink(destination: ClusterPage(cluster: cluster)) {
                        Text(cluster.name)
                    }
                }
            case "Boulders":
                ForEach(areaVM.area.boulders) {boulder in
                    NavigationLink(destination: BoulderPage(boulder: boulder)) {
                        ListItemView(
                            item: ListItem(
                                label: boulder.name,
                                detail: boulder.detailText))
                    }
                }
            default:
                Text("Nope")
            }
        }
        .navigationTitle(areaVM.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RoutesPage_Previews: PreviewProvider {
    static var previews: some View {
        if let area = try? Areas.loadArea("stoney_point.json") {
            AreaListPage(listType: "Routes")
                .environmentObject(AreaViewModel(area))
        }
    }
}
