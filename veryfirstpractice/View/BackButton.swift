//
//  BackButton.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 12.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit

class BackButton: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = frame.size.width/2
        dropShadow()
        layer.shadowColor = UIColor.white.cgColor
    }

}
