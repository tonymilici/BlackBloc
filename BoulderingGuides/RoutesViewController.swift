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
    let cellId = "RouteCell"
    
    public init(routes: [Route]) {
        super.init(nibName: "RoutesView", bundle: nil)
        _routes = routes
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (_routes?.count)!
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId) {
            cell.textLabel?.text = _routes?[indexPath.row].name
            return cell
        }
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        if let route = _routes?[indexPath.row] {
            cell.textLabel?.text = route.name
            cell.detailTextLabel?.text = "\(route.rating!)  \(route.getStars())"
        }
        
       return cell
    }
}
