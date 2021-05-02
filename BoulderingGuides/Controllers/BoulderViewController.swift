//
//  BoulderViewController.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/7/17.
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
import SwiftUI

public class BoulderViewController: UIViewController {
    @IBOutlet weak var _titleLabel: UILabel!
    @IBOutlet weak var _imageView: UIImageView!
    @IBOutlet weak var _descriptionView: UITextView!
    fileprivate var _boulder: Boulder?
    fileprivate let _cellId = "RouteCell"
    
    public init(boulder: Boulder) {
        super.init(nibName: "BoulderView", bundle: nil)
        _boulder = boulder
        title = "Boulder"
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "location.png"), style: .plain, target:self, action: #selector(self.navigate(sender:)))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        _titleLabel.text = _boulder?.name
        _descriptionView.text = _boulder?.description
        
        if let image = _boulder?.image {
            _imageView.image = UIImage(named: image)
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: _cellId) as! RouteTableViewCell? {
            if let r = route {
                cell.setRoute(route: r)
            }
            return cell
        }
        
        let cell = RouteTableViewCell(route: route, cellId: _cellId)
        return cell
    }

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Routes"
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let route = _boulder?.routes[indexPath.row]
        let routeViewController = UIHostingController(rootView: RoutePage(route: route!))
        navigationController?.pushViewController(routeViewController, animated: true)
    }
}
