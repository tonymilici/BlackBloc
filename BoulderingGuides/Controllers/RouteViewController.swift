//
//  RouteViewController.swift
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
        if let location = _route?.location {
            let map = NavigationMapViewController(location: location, size: 0.01, name: _route?.name)
            navigationController?.pushViewController(map, animated: true)
        }
    }
}
