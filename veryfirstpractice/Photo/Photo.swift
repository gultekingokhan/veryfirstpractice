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
    private var _description: String!
    
    var url: String {
        return _url
    }

    var id: String {
        return _id
    }
    
    var description: String {
        return _description
    }
    
    init(id: String, url: String, description: String) {
        _id = id
        _url = url
        _description = description
    }
    
}
