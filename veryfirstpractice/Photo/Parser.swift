//
//  Parser.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 11.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Parser {
    
    //Make reccuring constant definitions lines more light, in every functions!
    
    class func getPhotos(success: @escaping (_ photos: [Photo]) -> Void,
                         failure: @escaping (_ error: Error?) -> Void) {
        
        var photos = [Photo]()
        
        let constants = Constants()
        let url = constants.unsplash_curetad_photos_ready_url
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for object in json.arrayValue {
                    let photo = Photo(id: object["id"].stringValue, url: object["urls"]["regular"].stringValue, description: object["description"].stringValue)
                    photos.append(photo)
                }
                
                success(photos)
            case .failure(let error):
                print(error)
                failure(error)
            }
        }
    }
    
    class func searchPhotos(query: String,
                            success: @escaping (_ photos: [Photo]) -> Void,
                            failure: @escaping (_ error: Error?) -> Void) {
        
        var photos = [Photo]()

        let constants = Constants()
        let url: String = String(constants.searchPhotosURL(query: query, page: 1))
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                for object in json["results"].arrayValue {
                    
                    let photo = Photo(id: object["id"].stringValue, url: object["urls"]["regular"].stringValue, description: object["description"].stringValue)
                    photos.append(photo)
                }
                
                success(photos)
            case .failure(let error):
                print(error)
                failure(error)
            }
        }
    }
}
