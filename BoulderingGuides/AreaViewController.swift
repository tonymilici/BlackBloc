//
//  AreaViewController.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 5/13/18.
//  Copyright © 2018 BlackBloc Software. All rights reserved.
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
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
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
        
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cluster = _clusters?[indexPath.row]
        let clusterViewController = UIHostingController(rootView: ClusterPage(cluster: cluster!))
        navigationController?.pushViewController(clusterViewController, animated: true)
    }
}
