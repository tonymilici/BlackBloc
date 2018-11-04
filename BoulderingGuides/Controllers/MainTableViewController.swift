//
//  MainTableViewController.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/3/17.
//  Copyright © 2017 Black Bloc Apps. All rights reserved.
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:

//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

import Foundation
import UIKit

class MainTableViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    fileprivate let _areas = Areas()
    fileprivate let _cellId = "AreaCell"
    
    init() {
        super.init(nibName: "MainTableView", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: _cellId) {
            cell.textLabel?.text = _areas.getArea(index: indexPath.row).name
            return cell
        }
    let cell = UITableViewCell(style: .default, reuseIdentifier: _cellId)
        cell.textLabel?.text = _areas.getArea(index: indexPath.row).name
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
}

extension MainTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let area = _areas.getArea(index: indexPath.row)
        let mapController = AreaMapViewController(area: area)
        mapController.tabBarItem = UITabBarItem(title: "Navigate", image: UIImage(named: "location.png"), tag: 1)
        
        let routesController = AreaViewController(clusters: area.clusters)
        routesController.tabBarItem = UITabBarItem(title: "Routes", image: UIImage(named: "list.png"), tag: 2)
        
        let tabController = TabBarController()
        tabController.viewControllers = [mapController, routesController]
        tabController.title = area.name
        
        navigationController?.pushViewController(tabController, animated: true)
    }
}
