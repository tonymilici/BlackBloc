//
//  Areas.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/3/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import Foundation

public class Areas {
    var _areas: [String]?
    
    public init() {
        if let stream = InputStream(fileAtPath: Bundle.main.bundlePath + "/Areas.json") {
            stream.open()
            print(stream.hasBytesAvailable)
            do {
                let json = try JSONSerialization.jsonObject(with: stream)
                if let areas = json as? Dictionary<String, [String]> {
                    _areas = areas["Areas"];
                }
                
            }
                
            catch let error as NSError {
                print("Details of JSON parsing error:\n \(error)")
            }
        }
    }
    
    public func count() -> Int {
        return (_areas?.count)!
    }
    
    public func getArea(index: Int) -> String {
        return (_areas?[index])!
    }
}
