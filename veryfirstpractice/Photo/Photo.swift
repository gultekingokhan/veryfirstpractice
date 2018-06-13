//
//  Photo.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 9.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Photo {
    
    private var _url: String
    private var _id: String
    private var _description: String
    
    var url: String {
        return _url
    }

    var id: String {
        return _id
    }
    
    var description: String {
        return _description
    }
    
    var artist: Artist?
    
    init(id: String, url: String?, description: String?) {
        _id = id
        _url = url ?? ""

        if description == nil || description?.count == 0 {
            _description = "There is no description for this photo."
        } else {
            _description = description!
        }
    }
    
    /*It might be helpful
     func testingFunction(param1: String,
     onSuccess: @escaping (_ successParam: String) -> Void,
     onFailure: @escaping (_ failureParam: String) -> Void) {
     }
     */
    
}

