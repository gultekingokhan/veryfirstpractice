//
//  CVScrollView.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 10.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit

class CVScrollView: UIScrollView {

    //constants
    let leading: Int = 30, space: Int = 30
    var width: Int = 200, height: Int = 420
    
    override func awakeFromNib() {
        width = Int(UIScreen.main.bounds.size.width) - 2 * leading
        height = Int(UIScreen.main.bounds.size.height) - 2 * leading - 60 - 110
    }
    
    func createCards(photos: [Photo]) {
        
        var index = 0
        for photo in photos {
            
            let calculatedLeading: Int = self.calculateLeadingPoint(initialLeading: self.leading,
                                                                    width: self.width,
                                                                    verticalSpace: self.space,
                                                                    index: index)
            let container = Container(frame: CGRect(x:calculatedLeading,
                                                    y: 0,
                                                    width: self.width,
                                                    height: self.height))
            
            container.imageView.sd_setImage(with: URL(string: photo.url), completed: nil)
            
            addSubview(container)
            index += 1
        }
        
        let calculatedLeading: Int = self.calculateLeadingPoint(initialLeading: self.leading,
                                                                width: self.width,
                                                                verticalSpace: self.space,
                                                                index: index-1)
        contentSize = CGSize(width: calculatedLeading+width+leading,
                             height: Int(frame.size.height))
        
    }
    
    func calculateLeadingPoint(initialLeading: Int, width: Int, verticalSpace: Int, index: Int) -> Int {
        return initialLeading + index*(width+verticalSpace)
    }
}
