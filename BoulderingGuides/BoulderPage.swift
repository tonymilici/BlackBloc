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
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text(boulder.name)
                .font(.headline)
            
            Text(boulder.description!)
                .font(.system(size: 14))
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
            List {
                ForEach(boulder.routes) {route in
                    NavigationLink(destination: RoutePage(route: route)) {
                        Text(route.name)
                    }
                }
            }
            
            if let image = boulder.image {
                Image(uiImage: UIImage(named: image)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .padding(.top)
        .navigationTitle("Boulder")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BoulderPage_Previews: PreviewProvider {
    static var previews: some View {
        BoulderPage(boulder: Areas().getArea(index: 0).clusters[0].boulders[0])
    }
}