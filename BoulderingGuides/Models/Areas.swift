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

public class Areas {
    private var _areas: [Area] = []
    
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
        area.size = areaDict["Size"] as! Double?
        
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
            let boulderDict = boulderObj as! Dictionary<String, Any>
            let boulderName = boulderDict["Name"] as! String
            let boulder = Boulder(name: boulderName)
            boulder.description = boulderDict["Description"] as! String?
            cluster.boulders.append(boulder)
            boulder.image = boulderDict["Image"] as! String?
            boulder.location = parseLocation(locationDict: boulderDict["Location"])
            if let routeObjs = boulderDict["Routes"] as! [Any]? {
                parseRoutes(routeObjs: routeObjs, boulder: boulder)
            }
        }
    }
    
    private func parseRoutes(routeObjs: [Any], boulder: Boulder) {
        for routeObj in routeObjs {
            let routeDict = routeObj as! Dictionary<String, Any>
            let route = Route(name: (routeDict["Name"] as? String)!)
            route.description = routeDict["Description"] as! String?
            route.rating = routeDict["Rating"] as! String?
            route.stars = routeDict["Stars"] as! Int
            route.image = routeDict["Image"] as? String ?? boulder.image
            route.location = parseLocation(locationDict: routeDict["Location"]) ?? boulder.location
            boulder.routes.append(route)
        }
    }
    
    private func parseLocation(locationDict: Any?) -> Location? {
        if let locDict = locationDict as! Dictionary<String, Double>? {
            let latitude = locDict["Latitude"] as Double?
            let longitude = locDict["Longitude"] as Double?
            return Location(latitude: latitude!, longitude: longitude!)
        }
        return nil
    }
    
    public func count() -> Int {
        return _areas.count
    }
    
    public func getArea(index: Int) -> Area {
        return _areas[index]
    }
}
