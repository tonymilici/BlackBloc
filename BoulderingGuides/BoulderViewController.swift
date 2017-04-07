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
    private var _boulder: Boulder?
    
    public init(boulder: Boulder) {
        super.init(nibName: "BoulderView", bundle: nil)
        _boulder = boulder
        title = boulder.name
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
