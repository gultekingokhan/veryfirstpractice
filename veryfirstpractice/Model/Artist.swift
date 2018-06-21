//
//  Artist.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 13.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import Foundation

class Artist {
    
    private var _username: String
    private var _profileImageURL: String
    private var _id: String
    
    var username: String {
        return _username
    }
    
    var profileImageURL: String {
        return _profileImageURL
    }
    
    var id: String {
        return _id
    }
    
    var firstname: String?
    var lastname: String?

    var fullname: String {
        return "\(firstname ?? "") \(lastname ?? "")"
    }
    
    init(id: String, username: String?, profileImageURL: String?) {
        _id = id
        _username = username ?? ""
        _profileImageURL = profileImageURL ?? ""
    }
}
