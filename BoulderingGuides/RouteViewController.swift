//
//  RouteViewController.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/7/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import Foundation
import UIKit

public class RouteViewController: UIViewController {
    private var _route: Route?
    
    public init(route: Route) {
        super.init(nibName: "RouteView", bundle: nil)
        _route = route
        title = route.name
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
