//
//  BoulderViewController.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/7/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import Foundation
import UIKit

public class BoulderViewController: UIViewController {
    @IBOutlet weak var _descriptionView: UITextView!
    fileprivate var _boulder: Boulder?
    let cellId = "RouteCell"
    
    public init(boulder: Boulder) {
        super.init(nibName: "BoulderView", bundle: nil)
        _boulder = boulder
        title = boulder.name
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        _descriptionView.text = _boulder?.description
    }
}

extension BoulderViewController: UITableViewDataSource, UITableViewDelegate {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (_boulder?.routes.count)!
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId) {
            cell.textLabel?.text = _boulder?.routes[indexPath.row].name
            return cell
        }
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        if let route = _boulder?.routes[indexPath.row] {
            cell.textLabel?.text = route.name
            cell.detailTextLabel?.text = "\(route.rating!)  \(route.getStars())"
        }
        
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        return cell
    }

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Routes"
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let route = _boulder?.routes[indexPath.row]
        let routeViewController = RouteViewController(route: route!)
        navigationController?.pushViewController(routeViewController, animated: true)
    }
}
