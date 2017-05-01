//
//  SecondViewController.swift
//  Swiftplaces2
//
//  Created by mac on 4/26/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MapKit

class SecondViewController : UITableViewController, DataProtocol{
    
        let data = DataPlaces()
    override func viewDidLoad() {
        super.viewDidLoad()
        data.askForDataWith(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didRetrieveData(_ places: [Places]) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.listData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCell(withIdentifier: "cellule")! as UITableViewCell
        let label = cell.viewWithTag(1) as! UILabel
        label.text = data.listData[indexPath.row].place
        
        return cell
    }
    
}
