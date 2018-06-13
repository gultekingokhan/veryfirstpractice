//
//  RoundendView.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 13.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

    override func awakeFromNib() {
        layer.cornerRadius = frame.size.width/2
        layer.masksToBounds = true
    }

}
