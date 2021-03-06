//
//  Boulder.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/6/17.
//  Copyright © 2017 BlackBloc Software. All rights reserved.
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

public struct Boulder: Decodable, Identifiable {
    public let id = UUID()
    public let name: String
    public let description: String?
    public let routes: [Route]
    public let image: String?
    public let location: Location?
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case routes
        case image
        case location
    }
    
    public var detailText: String {
        var detailText = "0 routes"
        if routes.count == 1 {
            detailText = "1 route"
        }
        else if routes.count > 1 {
            detailText = "\(routes.count) routes"
        }
        return detailText;
    }
}
