//
//  SplashScreen.swift
//  BoulderingGuide
//
//  Created by Tony Milici on 5/28/21.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        GeometryReader {geo in
        Image(uiImage: UIImage(named: "stoney_point.jpg")!)
            .resizable()
            .scaledToFill()
            .frame(
                width: geo.size.width,
                height: geo.size.height,
                alignment: .center).clipped()
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
