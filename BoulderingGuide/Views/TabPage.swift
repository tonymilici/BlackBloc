//
//  MainPage.swift
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

struct TabPage: View {
    @State private var selection: Tab = .navigate
    
    let area: Area
    
    enum Tab {
        case navigate
        case routes
    }
    
    var body: some View {
        TabView(selection: $selection) {
            AreaMapPage(area: area)
                .tabItem {
                    Label("Navigate", systemImage: "safari")
                }
                .tag(Tab.navigate)
            
            RoutesPage(area: area)
                .tabItem {
                    Label("Routes", systemImage: "list.bullet")
                }
                .tag(Tab.routes)
        }
        .navigationTitle(area.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TabPage_Previews: PreviewProvider {
    static var previews: some View {
        TabPage(area: Areas().areas[0])
    }
}
