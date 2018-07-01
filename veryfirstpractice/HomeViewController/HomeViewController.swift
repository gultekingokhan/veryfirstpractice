//
//  HomeViewController.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 9.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class HomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: CVScrollView!
    @IBOutlet weak var morePhotosButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Parser.getPhotos(success: { (photos) in
            self.scrollView.createCards(photos: photos)
        }) { (error) in
            //Show alert
        }
    }

    @IBAction func moreButtonPressed(_ sender: Any) {
        let searchVC = SearchViewController(nibName: "SearchViewController", bundle: nil)
//        let nc = UINavigationController(rootViewController: searchVC)
//        nc.navigationBar.isHidden = true
        present(searchVC, animated: true, completion: nil)
    }
}
