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
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var _descriptionView: UITextView!
    fileprivate var _boulder: Boulder?
    let cellId = "RouteCell"
    
    public init(boulder: Boulder) {
        super.init(nibName: "BoulderView", bundle: nil)
        _boulder = boulder
        title = boulder.name
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Navigate", style: .plain, target:self, action: #selector(self.navigate(sender:)))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        _descriptionView.text = _boulder?.description
        if let image = _boulder?.image {
            imageView.image = UIImage(named: image)
        }
    }
    
    @objc
    private func navigate(sender: NSObject) {
        if let location = _boulder?.location {
            let map = NavigationMapViewController(location: location, size: 0.1, name: _boulder?.name)
            navigationController?.pushViewController(map, animated: true)
        }
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
        let route = _boulder?.routes[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! RouteTableViewCell? {
            if let r = route {
                cell.setRoute(route: r)
            }
            return cell
        }
        
        let cell = RouteTableViewCell(route: route, cellId: cellId)
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
