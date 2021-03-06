//
//  Areas.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/3/17.
//  Copyright © 2017 Black Bloc Apps. All rights reserved.
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

public class Areas: ObservableObject {
    @Published var areas: [AreaViewModel] = []
    
    private let dispatchQueue = DispatchQueue(label: "My Dispatch Queue")
    
    init() {
        loadAreasAsync()
    }
    
    private func loadAreasAsync() {
        dispatchQueue.async() {
            let a: [Area] = Areas.loadAreas()
            DispatchQueue.main.async() {
                self.areas = a.map {
                    AreaViewModel($0)
                }
            }
        }
    }
    
    public class func loadAreas() -> [Area] {
        var areas: [Area] = []
        
        if let docsDir = Bundle.main.resourcePath {
            let localFileManager = FileManager()
            let dirEnum = localFileManager.enumerator(atPath: docsDir)
            while let file = dirEnum?.nextObject() as? String {
                if file.hasSuffix(".json") {
                    if let area: Area = try? loadArea(file) {
                        areas.append(area)
                    }
                }
            }
        }
        return areas
    }

    public class func loadArea(_ filename: String) throws -> Area? {
        if let file = Bundle.main.url(forResource: filename, withExtension: nil) {
            if let data = try? Data(contentsOf: file) {
                let decoder = JSONDecoder()
                return try? decoder.decode(Area.self, from: data)
            }
        }
        return nil
    }
}
