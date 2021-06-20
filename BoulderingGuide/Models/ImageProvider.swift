//
//  ImageProvider.swift
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

import UIKit
import Combine

class ImageProvider: ObservableObject {
    @Published var image: UIImage?
    
    private let imageSpec: ImageSpec
    private var cancellable: AnyCancellable?
    
    private var cache: ImageCache?
    
    init(imageSpec: ImageSpec) {
        self.imageSpec = imageSpec
        self.cache = CacheProvider.imageCache
    }
    
    func load() {
        let spec = imageSpec
        let urlBuilder = UrlBuilder(imageSpec: spec)
        
        if let uiImage = cache?[imageSpec] {
            image = uiImage
        }
        else if let url = URL(string: urlBuilder.build()) {
            cancellable = URLSession.shared.dataTaskPublisher(for: url)
                .map {
                    UIImage(data: $0.data)
                }
                .replaceError(with: nil)
                .handleEvents(receiveOutput: { [weak self] in self?.cache?[spec] = $0 })
                .receive(on: DispatchQueue.main)
                .sink {
                    self.image = $0
                }
        }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
