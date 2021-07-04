//
//  AreaViewModel.swift
//  BoulderingGuide
//
//  Created by Tony Milici on 5/31/21.
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

import Foundation

class AreaViewModel: ObservableObject, Identifiable {
    let id = UUID()
    let area: Area
    let imageSyncer = ImageSyncer()
    
    init(_ area: Area) {
        self.area = area
    }
    
    public var name: String {
        area.name
    }
    
    func syncImages(progressUpdate: @escaping (Int64) -> Void) -> Int64 {
        let images = area.images.map {
            ImageSpec(area: area.name, image: $0)
        }
        
        imageSyncer.sync(images: images, progressUpdate: progressUpdate)
        
        return Int64(images.count)
    }
    
    func cancelSync() {
        imageSyncer.cancel()
    }
    
    class ImageSyncer {
        var downloaders: [ImageDownloader] = []
        var imageIndex = 0
        private var cancelled = false;
        
        func sync(images: [ImageSpec], progressUpdate: @escaping (Int64) -> Void)  {
            self.downloaders = images.map {
                ImageDownloader(imageSpec: $0)
            }
            
            downloadNextImage(progressUpdate: progressUpdate)
        }
        
        func downloadNextImage(progressUpdate: @escaping (Int64) -> Void) {
            let downloader = downloaders[imageIndex]
            downloader.download {
                print("downloading image\(downloader.imageSpec.image)")
                ImageFile.save(spec: downloader.imageSpec, imageData: $0)
                self.imageIndex += 1
                progressUpdate(Int64(self.imageIndex))
                
                if (self.imageIndex < self.downloaders.count && !self.cancelled) {
                    self.downloadNextImage(progressUpdate: progressUpdate)
                }
            }
        }
        
        func cancel() {
            cancelled = true
            imageIndex = 0
        }
    }
}
