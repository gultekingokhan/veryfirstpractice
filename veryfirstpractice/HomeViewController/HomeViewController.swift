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
    
    //constants
    let leading: Int  = 30
    let space: Int  = 30
    let width: Int  = 200
    let height: Int  = 320
    let count  = 5

    @IBAction func presentSearchScreen(_ sender: Any) {
        
        let searchVC = SearchViewController(nibName: "SearchViewController", bundle: nil)
        present(searchVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for x in 0..<count {
            
            let calculatedLeading: Int = calculateLeadingPoint(initialLeading: leading,
                                                                 width: width,
                                                                 verticalSpace: space,
                                                                 index: x)

            let container = Container(frame: CGRect(x:calculatedLeading,
                                                    y: leading,
                                                    width: width,
                                                    height: height))

            scrollView.addSubview(container)
        }
        


        
//        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
//        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
      
    }
    
    func calculateLeadingPoint(initialLeading: Int, width: Int, verticalSpace: Int, index: Int) -> Int {
        
        //It has not to be CGFloat type anymore, yay!
        //Edited: It has to be Int now, shit.
        //Edited: We will turn back here later.
        return initialLeading + index*(width+verticalSpace)
    }
    
    override func viewDidLayoutSubviews() {
        
        let calculatedLeading: Int = calculateLeadingPoint(initialLeading:leading,
                                                           width: width,
                                                           verticalSpace: space,
                                                           index: (count-1))
        scrollView.contentSize = CGSize(width: calculatedLeading+width+leading,
                                        height: Int(scrollView.frame.size.height-64))
    }

}
