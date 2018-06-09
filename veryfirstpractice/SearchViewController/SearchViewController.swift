//
//  SearchViewController.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 10.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchContainerView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
         searchTextField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchContainerView.dropShadow()
        searchContainerView.layer.cornerRadius = 8
        
       //https://unsplash.com/documentation#search-photos
    }

}
