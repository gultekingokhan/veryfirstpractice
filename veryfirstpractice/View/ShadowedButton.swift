//
//  ShadowedButton.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 10.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit

class ShadowedButton: UIButton {

    override func awakeFromNib() {
        dropShadow()
        layer.cornerRadius = 12
    }

}
