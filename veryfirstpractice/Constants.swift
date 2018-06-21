//
//  Constants.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 9.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import Foundation

typealias DownloadComplete = () -> ()


class Constants {
    
    private let UNSPLASH_CLIENT_ID = "e0897a040edfc6eab3ada63a7be08b74c9a148701f867d29955a5544cad5e85e"
    
    private let UNSPLASH_BASE_URL = "https://api.unsplash.com"
    
    let unsplash_curetad_photos_ready_url = "https://api.unsplash.com/photos/curated?client_id=e0897a040edfc6eab3ada63a7be08b74c9a148701f867d29955a5544cad5e85e"
    
    let unsplash_search_photos_url = ""

    func searchPhotosURL(query: String, page: Int) -> String {
        let pureURL = String(UNSPLASH_BASE_URL + "/search/photos?client_id=\(UNSPLASH_CLIENT_ID)&page=\(page)&query=\(query)" )
        return pureURL.encodeUrl()!
    }
    
    /*  Mock URLs
        https://api.unsplash.com/photos/curated?client_id=e0897a040edfc6eab3ada63a7be08b74c9a148701f867d29955a5544cad5e85e
        https://api.unsplash.com/search/photos?client_id=e0897a040edfc6eab3ada63a7be08b74c9a148701f867d29955a5544cad5e85e&page=1&query=random
    */
    
    /*  Test from command line
        xcodebuild test -workspace veryfirstpractice.xcworkspace -scheme "veryfirstpractice" -destination 'platform=iOS Simulator,name=iPhone 8,OS=latest'
    */
}

extension String
{
    func encodeUrl() -> String?
    {
        return self.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
    }
    func decodeUrl() -> String?
    {
        return self.removingPercentEncoding
    }
}
