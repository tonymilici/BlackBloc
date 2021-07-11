//
//  ClusterPage.swift
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

struct ClusterPage: View {
    let cluster: Cluster
    
    @State private var isNavigateActive = false
    @EnvironmentObject private var areaVM: AreaViewModel

    var body: some View {
        ZStack {
            List {
                Section(header: Text(cluster.name)) {
                    ForEach(cluster.boulders) {boulder in
                        //I think becase areaVM wasn't set in a NavigationView we have to set it again here
                        NavigationLink(destination: BoulderPage(boulder: boulder)
                                        .environment(\.areaName, areaVM.name)) {
                            ListItemView(
                                item: ListItem(
                                    label: boulder.name,
                                    detail: boulder.detailText))
                        }
                    }
                }
            }
            
            NavigationLink(destination: NavigationPage(location: cluster.location, title: cluster.name), isActive: $isNavigateActive) {
                EmptyView()
            }
        }
        .navigationTitle("Cluster")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button(action: { isNavigateActive = true }) {
                Image(systemName: "safari")
                    .accessibilityLabel("user Profile")
            }
        }
    }
}

struct ClusterPage_Previews: PreviewProvider {
    static var previews: some View {
        if let area = try? Areas.loadArea("stoney_point.json") {
            ClusterPage(cluster: area.clusters[0])
                .environmentObject(AreaViewModel(area))
        }
    }
}
