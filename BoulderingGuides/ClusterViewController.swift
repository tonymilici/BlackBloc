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
    var _boulders: [Boulder]?
    let cellId = "BoulderCell"
    
    public init(cluster: Cluster) {
        super.init(nibName: "ClusterView", bundle: nil)
        title = cluster.name
        _boulders = cluster.boulders
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (_boulders?.count)!
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId) {
            cell.textLabel?.text = _boulders?[indexPath.row].name
            return cell
        }
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")
        cell.textLabel?.text = _boulders?[indexPath.row].name
        
        var detailText = "0 routes"
        if let rts = _boulders?[indexPath.row].routes {
            detailText = "\(rts.count) route"
            if rts.count > 1 {
                detailText += "s"
            }
        }
        cell.detailTextLabel?.text = detailText
        
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        return cell
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let boulder = _boulders?[indexPath.row]
        let boulderViewController = BoulderViewController(boulder: boulder!)
        navigationController?.pushViewController(boulderViewController, animated: true)
    }
}
