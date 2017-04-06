//
//  ClusterViewController.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/6/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import Foundation
import UIKit

public class ClusterViewController: UITableViewController {
    public init(cluster: Cluster) {
        super.init(nibName: "ClusterView", bundle: nil)
        title = cluster.name
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
