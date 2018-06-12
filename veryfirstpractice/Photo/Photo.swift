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
    
    init(id: String?, url: String?, description: String?) {
        _id = id!
        _url = url!
        
        if description == nil || description?.count == 0 {
            _description = "There is no description for this photo."
        } else {
            _description = description!
        }
    }
    
    /*
    func photos() -> [Photo] {
        
        var photosArray = [Photo]()
        let constants = Constants()
        
        let url = constants.unsplash_curetad_photos_ready_url
        
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for object in json.arrayValue {
                    let photo = Photo(id: object["id"].stringValue, url: object["urls"]["regular"].stringValue, description: "")
                    photosArray.append(photo)
                }
            case .failure(let error):
                print(error)
            }
        }
        
        return photosArray
    }
    */
    
    
    /*It might be helpful
     func testingFunction(param1: String,
     onSuccess: @escaping (_ successParam: String) -> Void,
     onFailure: @escaping (_ failureParam: String) -> Void) {
     }
     */
    
}

