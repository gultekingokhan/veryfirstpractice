//
//  VFTableView.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 11.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit

class VFTableView: UITableView {

    override func awakeFromNib() {
        contentInset = UIEdgeInsetsMake(0, 0, 20, 0)
    }
    
    func registerNib(string: String) {
        let nib = UINib(nibName: string, bundle: nil)
        register(nib, forCellReuseIdentifier: string)
    }

}
