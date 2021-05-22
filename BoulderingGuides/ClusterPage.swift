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
    
    var body: some View {
        List {
            Section(header: Text(cluster.name)) {
                ForEach(cluster.boulders) {boulder in
                    NavigationLink(destination: BoulderPage(boulder: boulder)) {
                        ListItemView(
                            item: ListItem(
                                label: boulder.name,
                                detail: getDetailText(boulder: boulder)))
                    }
                }
            }
        }
        .navigationTitle("Cluster")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            NavigationLink(destination: NavigationPage(location: cluster.location, title: cluster.name)) {
                Button(action: {  }) {
                    Image(systemName: "safari")
                        .accessibilityLabel("user Profile")
                }
            }
        }
    }
    
    private func getDetailText(boulder: Boulder) -> String {
        var detailText = "0 routes"
        if boulder.routes.count == 1 {
            detailText = "1 route"
        }
        else if boulder.routes.count > 1 {
            detailText = "\(boulder.routes.count) routes"
        }
        return detailText;
    }
}

struct ClusterPage_Previews: PreviewProvider {
    static var previews: some View {
        ClusterPage(cluster: Areas().areas[0].clusters[0])
    }
}
