//
//  RouteViewController.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/7/17.
//  Copyright © 2017 Imortal Apps. All rights reserved.
//

import Foundation
import UIKit

public class RouteViewController: UIViewController {
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var _routeImageView: UIImageView!
    
    private var _route: Route?
    
    public init(route: Route) {
        super.init(nibName: "RouteView", bundle: nil)
        _route = route
        title = route.name
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Navigate", style: .plain, target: self, action: #selector(self.navigate(sender:)))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        if let route = _route {
            let text = "\(route.rating!)  \(route.getStars())\n\n\(route.description!)"
            descriptionTextView.text = text
            if let image = route.image {
                _routeImageView.image = UIImage(named: image)
            }
        }
    }
    
    @objc
    private func navigate(sender: NSObject) {
        let map = RouteMapViewController(route: _route!)
        navigationController?.pushViewController(map, animated: true)
    }
}
