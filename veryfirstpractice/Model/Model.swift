//
//  Model.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 9.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Model {

    func photos() -> [Photo] {
        
        var photosArray = [Photo]()
        let constants = Constants()
        
        let url = constants.unsplash_curead_photos_ready_url
        
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for object in json.arrayValue {
                    let photo = Photo(id: object["id"].stringValue, url: object["urls"]["regular"].stringValue)
                    photosArray.append(photo)
                }
            case .failure(let error):
                print(error)
            }
        }
        
        return photosArray
    }
 
}
