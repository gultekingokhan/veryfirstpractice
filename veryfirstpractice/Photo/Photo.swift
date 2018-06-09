//
//  Photo.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 9.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import Foundation

class Photo {
    
    private var _url: String!
    private var _id: String!
    
    var url: String {
        return _url
    }

    var id: String {
        return _id
    }
    
    init(id: String, url: String) {
        _id = id
        _url = url
    }
    
}
