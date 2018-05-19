//
//  ClusterViewController.swift
//  BoulderingGuides
//
//  Created by Tony Milici on 4/6/17.
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

public class ClusterViewController: UITableViewController {
    private var _cluster: Cluster?
    private let _cellId = "BoulderCell"
    
    public init(cluster: Cluster) {
        super.init(nibName: "ClusterView", bundle: nil)
        title = "Cluster"
        _cluster = cluster
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (_cluster?.boulders.count)!
    }
    
    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return _cluster?.name
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let boulder = _cluster?.boulders[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: _cellId) {
            cell.textLabel?.text = boulder?.name
            cell.detailTextLabel?.text = getDetailText(boulder: boulder)
            return cell
        }
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: _cellId)
        
        cell.textLabel?.text = boulder?.name
        
        cell.detailTextLabel?.text = getDetailText(boulder: boulder)
        
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        return cell
    }
    
    private func getDetailText(boulder: Boulder?) -> String {
        var detailText = "0 routes"
        if let rts = boulder?.routes {
            if rts.count == 1 {
                detailText = "1 route"
            }
            else if rts.count > 1 {
                detailText = "\(rts.count) routes"
            }
        }
        return detailText;
    }
    
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let boulder = _cluster?.boulders[indexPath.row]
        let boulderViewController = BoulderViewController(boulder: boulder!)
        navigationController?.pushViewController(boulderViewController, animated: true)
    }
}
