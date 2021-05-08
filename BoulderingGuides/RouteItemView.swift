//
//  RouteItemView.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 5/8/21.
//  Copyright © 2021 Imortal Apps. All rights reserved.
//

import SwiftUI

struct RouteItemView: View {
    let route: Route
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(route.name)
            Text("\(route.rating)  \(route.getStars)")
                .font(.system(size: 12))
        }
    }
}

struct RouteItemView_Previews: PreviewProvider {
    static var previews: some View {
        RouteItemView(route: Areas().getArea(index: 0).getRoutes()[2])
    }
}
