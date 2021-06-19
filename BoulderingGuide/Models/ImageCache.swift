//
//  ImageCache.swift
//  BoulderingGuide
//
//  Created by Tony Milici on 6/13/21.
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

import Foundation
import UIKit

class ImageSpec: NSObject {
    let area: String
    let image: String
    
    var spac: String {
        "\(area)/\(image)"
    }
    
    init(area: String, image: String) {
        self.area = area
        self.image = image
    }
}

protocol ImageCache {
    subscript(_ key: ImageSpec) -> UIImage? { get set }
}

struct ImageMemoryCache: ImageCache {
    private let cache = NSCache<ImageSpec, UIImage>()
    
    subscript(_ key: ImageSpec) -> UIImage? {
        get { cache.object(forKey: key as ImageSpec) }
        set {
            newValue == nil ?
                cache.removeObject(forKey: key) :
                cache.setObject(newValue!, forKey: key)
        }
    }
}

struct ImageDiskCache: ImageCache {
    subscript(_ key: ImageSpec) -> UIImage? {
        get {
            let path = ImageFile.getFilePath(key)
            return UIImage(contentsOfFile: path.path)
        }
        set {
            if let image = newValue {
                ImageFile.save(spec: key, image: image)
            }
        }
    }
}
