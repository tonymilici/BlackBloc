//
//  RouteTableViewCell.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/11/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import Foundation
import UIKit

public class RouteTableViewCell: UITableViewCell {
    public init(route: Route?, cellId: String) {
        super.init(style: .subtitle, reuseIdentifier: cellId)
        
        if let r = route {
            setRoute(route: r)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setRoute(route: Route) {
        textLabel?.text = route.name
        detailTextLabel?.text = "\(route.rating!)  \(route.getStars())"
    }
}
