//
//  Areas.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/3/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import Foundation

public class Areas {
    var _areas: [Area] = []
    
    public init() {
        if let stream = InputStream(fileAtPath: Bundle.main.bundlePath + "/Areas.json") {
            stream.open()
            print(stream.hasBytesAvailable)
            do {
                let json = try JSONSerialization.jsonObject(with: stream)
                if let areasDict = json as? Dictionary<String, [Any]> {
                    parseAreas(areasDict:areasDict)
                }
            }
                
            catch let error as NSError {
                print("Details of JSON parsing error:\n \(error)")
            }
        }
    }
    
    private func parseAreas(areasDict: Dictionary<String, [Any]>) {
        if let areasColl = areasDict["Areas"] {
            for obj in areasColl {
                if let areaDict = obj as? Dictionary<String, Any> {
                    parseArea(areaDict: areaDict)
                }
            }
        }
    }
    
    private func parseArea(areaDict: Dictionary<String, Any>) {
        let area = Area(name: (areaDict["Name"])! as! String)
        let locDict = areaDict["Location"] as! Dictionary<String, Double>
        let latitude = locDict["Latitude"] as Double?
        let longitude = locDict["Longitude"] as Double?
        area.location = Location(latitude: latitude!, longitude: longitude!)
        
        if let clusters = areaDict["Clusters"] {
            for clus in clusters as! [Any] {
                let cluster = clus as! Dictionary<String, Any>
                let centerX = cluster["CenterX"] as! Double
                let centerY = cluster["CenterY"] as! Double
                let radius = cluster["Radius"] as! Double
                let name = cluster["Name"] as! String
                
                area.clusters.append(Cluster(name: name, centerX: centerX, centerY: centerY, radius: radius))
            }
        }
        
        _areas.append(area)
    }
    
    public func count() -> Int {
        return _areas.count
    }
    
    public func getArea(index: Int) -> Area {
        return _areas[index]
    }
}
