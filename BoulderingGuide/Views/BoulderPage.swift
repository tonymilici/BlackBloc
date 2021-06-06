//
//  BoulderPage.swift
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

struct BoulderPage: View {
    let boulder: Boulder
    
    @State private var isNavigateActive = false
    @EnvironmentObject private var areaVM: AreaViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text(boulder.name)
                .font(.headline)
            
            Text(boulder.description!)
                .font(.system(size: 14))
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            
            List {
                Section(header: Text("Routes")){
                    ForEach(boulder.routes) {route in
                        NavigationLink(destination: RoutePage(route: route)) {
                            ListItemView(
                                item: ListItem(
                                    label: route.name,
                                    detail: "\(route.rating)  \(route.getStars)"))
                        }
                    }
                }
            }
            
            if let image = boulder.image {
                AsyncImage(source: image, urlBuilder: UrlBuilder(areaName: areaVM.name))
            }
            
            NavigationLink(destination: NavigationPage(location: boulder.location!, title: boulder.name), isActive: $isNavigateActive) {
                EmptyView()
            }
        }
        .padding(8)
        .navigationTitle("Boulder")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button(action: { isNavigateActive = true }) {
                Image(systemName: "safari")
            }
            .disabled(boulder.location == nil)
        }
    }
}

struct BoulderPage_Previews: PreviewProvider {
    static var previews: some View {
        if let area = try? Areas.loadArea("stoney_point.json") {
            BoulderPage(boulder: area.clusters[0].boulders[0])
                .environmentObject(AreaViewModel(area))
        }
    }
}
