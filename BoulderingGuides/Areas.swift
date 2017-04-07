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
        
        if let clusters = areaDict["Clusters"] as! [Any]? {
            parseClusters(clusters: clusters, area: area)
        }
        
        _areas.append(area)
    }
    
    private func parseClusters(clusters: [Any], area: Area) {
        for clusterObj in clusters {
            let clusterDict = clusterObj as! Dictionary<String, Any>
            let centerX = clusterDict["CenterX"] as! Double
            let centerY = clusterDict["CenterY"] as! Double
            let radius = clusterDict["Radius"] as! Double
            let name = clusterDict["Name"] as! String
            var cluster = Cluster(name: name, centerX: centerX, centerY: centerY, radius: radius)
            if let boulderObjs = clusterDict["Boulders"] as! [Any]? {
                parseBoulders(boulderObjs: boulderObjs, cluster: &cluster)
            }
            
            area.clusters.append(cluster)
        }
    }
    
    private func parseBoulders(boulderObjs: [Any], cluster: inout Cluster) {
        for boulderObj in boulderObjs {
            let boulderDict = boulderObj as! Dictionary<String, String>
            let boulderName = boulderDict["Name"]!
            let boulder = Boulder(name: boulderName)
            boulder.description = boulderDict["Description"]
            cluster.boulders.append(boulder)
        }
    }
    
    public func count() -> Int {
        return _areas.count
    }
    
    public func getArea(index: Int) -> Area {
        return _areas[index]
    }
}
