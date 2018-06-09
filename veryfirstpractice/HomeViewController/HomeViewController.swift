//
//  HomeViewController.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 9.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    let leading: Int  = 30, space: Int  = 30, width: Int  = 200, height: Int  = 80, count  = 5

    @IBAction func presentSearchScreen(_ sender: Any) {
        let searchVC = SearchViewController(nibName: "SearchViewController", bundle: nil)
        present(searchVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()

    }
    
    func makeUI() {
        for x in 0..<count {
            let calculatedLeading: Int = Container.calculateLeadingPoint(initialLeading: leading,
                                                                         width: width,
                                                                         verticalSpace: space,
                                                                         index: x)
            let container = Container(frame: CGRect(x:calculatedLeading,
                                                    y: leading,
                                                    width: width,
                                                    height: height))
            scrollView.addSubview(container)
        }
    }
    
    override func viewDidLayoutSubviews() {
        
        let calculatedLeading: Int = Container.calculateLeadingPoint(initialLeading:leading,
                                                           width: width,
                                                           verticalSpace: space,
                                                           index: (count-1))
        scrollView.contentSize = CGSize(width: calculatedLeading+width+leading,
                                        height: Int(scrollView.frame.size.height-64))
    }

}
