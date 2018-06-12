//
//  DetailViewController.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 12.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var photo: Photo?
    
    @IBOutlet weak var photoView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
                
        photoView.sd_setImage(with: URL(string: (photo?.url)!), completed: nil)
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
