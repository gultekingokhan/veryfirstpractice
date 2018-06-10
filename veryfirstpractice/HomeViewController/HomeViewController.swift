//
//  HomeViewController.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 9.06.2018.
//  Copyright © 2018 Gokhan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class HomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var morePhotosButton: UIButton!
    var container = Container()
    var photos = [Photo]()
    var cards = [Container]()
    
    //constants
    let leading: Int  = 30
    let space: Int  = 30
    var width: Int  = 200
    var height: Int  = 420

    override func viewDidLoad() {
        super.viewDidLoad()
        
        width = Int(UIScreen.main.bounds.size.width) - 2 * leading
        height = Int(UIScreen.main.bounds.size.height) - 2 * leading - 60 - 110
        
        morePhotosButton.dropShadow()
        morePhotosButton.layer.cornerRadius = 12
        
        getPhotos()
        
    }

    func getPhotos() {
        
        let constants = Constants()
        let url = constants.unsplash_curetad_photos_ready_url
        
        Alamofire.request(url, method: .get).validate().responseJSON { response in

            var index = 0

            switch response.result {
            case .success(let value):
                let json = JSON(value)
                for object in json.arrayValue {
                    let photo = Photo(id: object["id"].stringValue, url: object["urls"]["regular"].stringValue, description: object["description"].stringValue)
                    self.photos.append(photo)

                    
                    let calculatedLeading: Int = self.calculateLeadingPoint(initialLeading: self.leading,
                                                                       width: self.width,
                                                                       verticalSpace: self.space,
                                                                       index: index)
                    
                    let container = Container(frame: CGRect(x:calculatedLeading,
                                                            y: 0,
                                                            width: self.width,
                                                            height: self.height))
                    
                    container.imageView.sd_setImage(with: URL(string: photo.url), completed: nil)

                    self.cards.append(container)
                    
                    self.scrollView.addSubview(container)
                    
                    index += 1

                    
                }
                
                self.setContentSizeForScrollView()
                
            case .failure(let error):
                print(error)
            }
        }
    
    }
    
    func updateCard(photo: Photo, index: Int) {
        let card: Container = cards[index]
        card.imageView.sd_setImage(with: URL(string: photo.url), completed: nil)

    }


    func calculateLeadingPoint(initialLeading: Int, width: Int, verticalSpace: Int, index: Int) -> Int {
        return initialLeading + index*(width+verticalSpace)
    }
    
    func setContentSizeForScrollView() {
        let calculatedLeading: Int = calculateLeadingPoint(initialLeading:leading,
                                                           width: width,
                                                           verticalSpace: space,
                                                           index: (photos.count-1))
        scrollView.contentSize = CGSize(width: calculatedLeading+width+leading,
                                        height: Int(scrollView.frame.size.height))
    }
    
    @IBAction func showSearchScreen(_ sender: Any) {
        let searchVC = SearchViewController(nibName: "SearchViewController", bundle: nil)
        present(searchVC, animated: true, completion: nil)
    }
   

}
