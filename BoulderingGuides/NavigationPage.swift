//
//  NavigationPage.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 5/22/21.
//  Copyright © 2021 Imortal Apps. All rights reserved.
//

import SwiftUI

struct NavigationPage: View {
    let boulder: Boulder
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct NavigationPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationPage(boulder: Areas().areas[0].clusters[0].boulders[0])
    }
}
