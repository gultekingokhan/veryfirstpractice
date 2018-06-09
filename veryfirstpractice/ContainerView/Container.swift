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

    func dropShadow() {
    
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 0);
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 6
        
    }
    
    func makeRadius() {
        contentView.layer.cornerRadius = 12
    }
    
    class func calculateLeadingPoint(initialLeading: Int, width: Int, verticalSpace: Int, index: Int) -> Int {
        return initialLeading + index*(width+verticalSpace)
    }
}
