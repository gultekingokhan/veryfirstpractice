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
            print("Error: \(String(describing: error?.localizedDescription))")
        }
    }

    @IBAction func moreButtonPressed(_ sender: Any) {
        let searchVC = SearchViewController(nibName: "SearchViewController", bundle: nil)
        present(searchVC, animated: true, completion: nil)
    }
}
