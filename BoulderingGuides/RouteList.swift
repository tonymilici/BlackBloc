//
//  RouteList.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 5/2/21.
//  Copyright © 2021 Imortal Apps. All rights reserved.
//

import SwiftUI

struct RouteList: View {
    let routes: [Route]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RouteList_Previews: PreviewProvider {
    static var previews: some View {
        RouteList(routes: Areas().getArea(index: 0).clusters[0].boulders[0].routes)
    }
}
