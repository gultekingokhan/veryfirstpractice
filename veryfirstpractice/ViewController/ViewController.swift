//
//  ViewController.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 9.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var countries: [String] = ["Sweden","Netherlands","Germany","Denmark","Norway"]
    
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Countries"
        
        let nib = UINib(nibName: "CountryCell", bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: "CountryCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CountryCell {
            
            let countryName = countries[indexPath.row]
            cell.nameLabel.text = countryName
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}

