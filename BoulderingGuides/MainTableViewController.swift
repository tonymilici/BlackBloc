//
//  MainTableViewController.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/3/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import Foundation
import UIKit

class MainTableViewController: UITableViewController {
    let _areas = Areas()
    let cellId = "AreaCell"
    
    init() {
        super.init(style: UITableViewStyle.plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _areas.count()
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId) {
            cell.textLabel?.text = _areas.getArea(index: indexPath.row).name
            return cell
        }
        let cell = UITableViewCell()
        cell.textLabel?.text = _areas.getArea(index: indexPath.row).name
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        return cell
    }
}
