//
//  AsyncImage.swift
//  BoulderingGuide
//
//  Created by Tony Milici on 5/30/21.
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

struct AsyncImage: View {
    @StateObject private var provider: ImageProvider
    
    init(imageSpec: ImageSpec) {
        let provider = ImageProvider(imageSpec: imageSpec)
        _provider = StateObject(wrappedValue: provider)
    }
    
    var body: some View {
        content
            .onAppear(perform: provider.load)
    }

    private var content: some View {
        Group {
            if provider.image != nil {
                Image(uiImage: provider.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
            } else {
                Color.gray.opacity(0.5)
            }
        }
    }
}

struct AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
            if let area = try? Areas.loadArea("stoney_point.json") {
                AsyncImage(imageSpec: ImageSpec(area: area.name, image: "say_goodnight_fopuxo.jpg"))
            }
    }
}
