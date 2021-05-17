//
//  MainPage.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 5/17/21.
//  Copyright © 2021 Imortal Apps. All rights reserved.
//

import SwiftUI

struct MainPage: View {
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
                    Label("Navigate", systemImage:
                    "safari")
                }
                .tag(Tab.navigate)
            RoutesPage(area: area)
                .tabItem {
                    Label("Routes", systemImage: "list.bullet")
                }
                .tag(Tab.routes)
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage(area: Areas().getArea(index: 0))
    }
}
