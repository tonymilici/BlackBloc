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
        let route = _routes?[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! RouteTableViewCell? {
            if let r = route {
                cell.setRoute(route: r)
            }
            return cell
        }
        
        let cell = RouteTableViewCell(route: route, cellId: cellId)
        return cell
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let route = _routes?[indexPath.row]
        let routeViewController = RouteViewController(route: route!)
        navigationController?.pushViewController(routeViewController, animated: true)
    }
}
