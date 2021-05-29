//
//  Loader.swift
//  BoulderingGuide
//
//  Created by Tony Milici on 5/28/21.
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

public func loadAreas() -> [Area] {
    guard let docsDir = Bundle.main.resourcePath
    else {
        return []
    }
    
    let localFileManager = FileManager()

    let dirEnum = localFileManager.enumerator(atPath: docsDir)
    
    var areas: [Area] = []

    while let file = dirEnum?.nextObject() as? String {
        if file.hasSuffix(".json") {
            let area: Area = loadArea(file)
            areas.append(area)
        }
    }
    return areas
}

func loadArea(_ filename: String) -> Area {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't fin \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Coudln't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(Area.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(Area.self):\n\(error)")
    }
}
