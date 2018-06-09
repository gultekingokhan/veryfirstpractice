//
//  ViewController.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 9.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var countries = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries = ["Sweden","Netherlands","Germany","Denmark","Norway"]
        
    }


}

