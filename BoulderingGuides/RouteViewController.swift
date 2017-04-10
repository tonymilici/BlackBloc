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
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    private var _route: Route?
    
    public init(route: Route) {
        super.init(nibName: "RouteView", bundle: nil)
        _route = route
        title = route.name
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        descriptionTextView.text = _route?.description
        ratingLabel.text = _route?.rating
        
        if (_route?.stars)! < 4 {
            star4.isHidden = true
        }
        if (_route?.stars)! < 3 {
            star3.isHidden = true
        }
        if (_route?.stars)! < 2 {
            star2.isHidden = true
        }
        if (_route?.stars)! < 1 {
            star2.isHidden = true
        }
    }
}
