//
//  DetailViewController.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 12.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit
import Hero

class DetailViewController: UIViewController {

    var photo: Photo!
    var you: SearchViewController?
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var fullnameLabel: UILabel!
    
    @IBOutlet weak var searchContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        photoView.sd_setImage(with: URL(string: (photo?.url)!), completed: nil)
        descriptionLabel.text = photo?.description
        usernameLabel.text = photo.artist?.username
        fullnameLabel.text = photo.artist?.fullname
        userImageView.sd_setImage(with: URL(string: (photo.artist?.profileImageURL)!), completed: nil)
        
        self.hero.isEnabled = true
        photoView.hero.id = "hero"
        searchContainerView.hero.id = "containerView"
        
        self.view.hero.modifiers = [.translate(y:100)]
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        //navigationController?.popViewController(animated: true)
        hero.replaceViewController(with: you!)

    }
}
