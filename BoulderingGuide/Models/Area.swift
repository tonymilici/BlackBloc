//
//  Area.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/4/17.
//  Copyright © 2017 Black Bloc Software. All rights reserved.
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

public struct Location: Decodable {
    public let latitude: Double
    public let longitude: Double
}

public struct Area: Decodable {
    public let name: String
    public let location: Location
    public let size: Double
    public let clusters: [Cluster]
    
    public var routes: [Route] {
        var routes: [Route] = []
        for boulder in boulders  {
            for route in boulder.routes {
                routes.append(route)
            }
        }
        return routes
    }
    
    public var boulders: [Boulder] {
        var boulders: [Boulder] = []
        for cluster in clusters {
            for boulder in cluster.boulders {
                boulders.append(boulder)
            }
        }
        return boulders
    }
    
    public var images: [String] {
        var images: Set<String> = []
        
        for cluster in clusters {
            for boulder in cluster.boulders {
                if let image = boulder.image {
                    images.insert(image)
                }
                for route in boulder.routes {
                    if let image = route.image {
                        images.insert(image)
                    }
                }
            }
        }
        
        return Array(images);
    }
}
