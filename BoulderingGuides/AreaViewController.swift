//
//  AreaViewController.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 5/13/18.
//  Copyright © 2018 Imortal Apps. All rights reserved.
//

import Foundation
import UIKit

public class AreaViewController: UITableViewController {
    private var _clusters: [Cluster]?
    private let _cellId = "ClusterCell"
    
    public init(clusters: [Cluster]) {
        super.init(nibName: "AreaView", bundle: nil)
        _clusters = clusters
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (_clusters?.count)!
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cluster = _clusters?[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: _cellId) {
            cell.textLabel?.text = cluster?.name
            return cell
        }
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: _cellId)
        cell.textLabel?.text = _clusters?[indexPath.row].name
        
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        return cell
    }
}