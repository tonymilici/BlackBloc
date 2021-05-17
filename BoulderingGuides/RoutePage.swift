//
//  RoutePage.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 5/2/21.
//  Copyright © 2021 Black Bloc Software. All rights reserved.
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

struct RoutePage: View {
    var route: Route
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text(route.name)
                .font(.headline)
            Text("\(route.rating)  \(route.getStars)\n\n\(route.description!)")
                .font(.system(size: 14))
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
            if let image = route.image {
                Image(uiImage: UIImage(named: image)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .padding(.top)
    }
}

struct RoutePage_Previews: PreviewProvider {
    static var previews: some View {
        RoutePage(route: Areas().getArea(index: 0).routes[2])
    }
}
