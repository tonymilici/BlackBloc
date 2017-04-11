//
//  RoutesViewController.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/11/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import Foundation
import UIKit

public class RoutesViewController: UITableViewController {
    private var _routes: [Route]?
    
    public init(routes: [Route]) {
        super.init(nibName: "RoutesView", bundle: nil)
        _routes = routes
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
