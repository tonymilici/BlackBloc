//
//  Boulder.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/6/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import Foundation

public class Boulder {
    var name: String?
    var description: String?
    var routes: [Route] = []
    
    public init(name: String) {
        self.name = name
    }
}