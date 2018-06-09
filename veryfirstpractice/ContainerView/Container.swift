//
//  Container.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 9.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit

class Container: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        
        Bundle.main.loadNibNamed("Container", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        dropShadow()
        makeRadius()
    }
    
    func makeRadius() {
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        imageView.layer.masksToBounds = true
    }
    
    //        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    //        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    //        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
}

extension UIView {
    
    func dropShadow() {
        
        layer.masksToBounds = false
        //layer.shadowColor = UIColor.red_f().cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0);
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 6
        
    }
}
