//
//  MainTableViewController.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/3/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import Foundation
import UIKit

class MainTableViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    let _areas = Areas()
    let cellId = "AreaCell"
    
    init() {
        super.init(nibName: "MainTableView", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
}

extension MainTableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _areas.count()
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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

extension MainTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let area = _areas.getArea(index: indexPath.row)
        let mapController = MapViewController(area: area)
        mapController.tabBarItem = UITabBarItem(title: "Navigate", image: nil, tag: 1)
        
        let routesController = RoutesViewController(routes:area.getRoutes())
        routesController.tabBarItem = UITabBarItem(title: "Routes", image: nil, tag: 2)
        
        let tabController = TabBarController()
        tabController.viewControllers = [mapController, routesController]
        tabController.title = area.name
        
        navigationController?.pushViewController(tabController, animated: true)
    }
}
