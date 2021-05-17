//
//  AreaMapPage.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 5/17/21.
//  Copyright © 2021 Imortal Apps. All rights reserved.
//

import SwiftUI

struct AreaMapPage: UIViewRepresentable {
    let area: Area
    
    func makeUIView(context: Context) -> UIView {
        let controller = AreaMapViewController(area: area)
        return controller.view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

struct AreaMapPage_Previews: PreviewProvider {
    static var previews: some View {
        AreaMapPage(area: Areas().getArea(index: 0))
    }
}
