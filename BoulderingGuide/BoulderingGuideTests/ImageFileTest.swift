//
//  FileSaverTest.swift
//  BoulderingGuideTests
//
//  Created by Tony Milici on 6/19/21.
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

import XCTest
@testable import BoulderingGuide

class ImageFileTest: XCTestCase {
    
    func test_save() {
        let image = UIImage(named: "stoney_point.jpg")
        
        XCTAssertNotNil(image)
        
        let spec = ImageSpec(area: "Stoney Point", image: "stoney_point.jpg")
        
        let dir = ImageFile.getDirPath(spec)
        XCTAssertNotNil(dir)
        
        if FileManager.default.fileExists(atPath: dir.path) {
            do {
                try FileManager.default.removeItem(at: dir)
            }
            catch {}
        }
        
        XCTAssertFalse(FileManager.default.fileExists(atPath: dir.path))
        
        ImageFile.save(spec: spec, image: image!)
        
        let file = ImageFile.getFilePath(spec)
        XCTAssertTrue(FileManager.default.fileExists(atPath: file.path))
        
        let savedImage = UIImage(contentsOfFile: file.path)
        XCTAssertNotNil(savedImage)
    }
    
}
