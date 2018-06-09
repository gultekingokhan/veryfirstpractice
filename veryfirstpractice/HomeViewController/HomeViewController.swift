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
    let leading: Int  = 20
    let space: Int  = 20
    let width: Int  = 120
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let count = 5
        
        for x in 0..<count {
            
            let calculatedLeading: Int = calculateLeadingPoint(initialLeading: leading,
                                                                 width: width,
                                                                 verticalSpace: space,
                                                                 index: x)

            let container = Container(frame: CGRect(x:calculatedLeading, y: leading, width: width, height: width))
            scrollView.addSubview(container)
        }
        
        let calculatedLeading: Int = calculateLeadingPoint(initialLeading: leading, width: width, verticalSpace: space, index: (count-1))

        scrollView.contentSize = CGSize(width: calculatedLeading+width+leading, height: Int(UIScreen.main.bounds.size.height-64))
        
     /*
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        */
    }
    
    func calculateLeadingPoint(initialLeading: Int, width: Int, verticalSpace: Int, index: Int) -> Int {
        
        //It has not to be CGFloat type anymore, yay!
        //Edited: It has to be Int now, shit.
        return initialLeading + index*(width+verticalSpace)
    }
    

}
