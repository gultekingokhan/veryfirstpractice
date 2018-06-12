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
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
                
        photoView.sd_setImage(with: URL(string: (photo?.url)!), completed: nil)
        descriptionLabel.text = photo?.description
        
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
