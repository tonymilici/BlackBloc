//
//  ImageFile.swift
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

import Foundation
import UIKit

struct ImageFile {
    
    static var fileManager: FileManager {
        FileManager.default
    }
    
    static func save(spec: ImageSpec, imageData: Data?) {
        let dirPath = getDirPath(spec)
        let dirPathStr = dirPath.path
        
        if !fileManager.fileExists(atPath: dirPathStr) {
            do {
                try fileManager.createDirectory(
                    atPath: dirPathStr,
                    withIntermediateDirectories: false,
                    attributes: nil)
            }
            catch {
                print("could not create directory \(dirPathStr)")
            }
        }
    
        let file = getFilePath(spec)
        
        do {
            try imageData?.write(to: file)
        }
        catch {
            print("unable to save image \(file.absoluteString). \(error)")
        }
        
    }
    
    static func getDirPath(_ spec: ImageSpec) -> URL {
        let fileManager = FileManager.default
        let cachePaths = fileManager.urls(for: .documentDirectory,
                                          in: .userDomainMask)
        let cacheDirectory = cachePaths[0]
        
        return cacheDirectory.appendingPathComponent("\(spec.area)")
    }
    
    static func getFilePath(_ spec: ImageSpec) -> URL {
        let dirPath = getDirPath(spec)
        return dirPath.appendingPathComponent("\(spec.image)")
    }
}
