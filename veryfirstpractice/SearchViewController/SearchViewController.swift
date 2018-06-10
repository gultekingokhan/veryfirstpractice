//
//  SearchViewController.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 10.06.2018.

import Alamofire
import SwiftyJSON
import SDWebImage

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    var photos = [Photo]()
    @IBOutlet weak var tableView: UITableView?
    
    @IBOutlet weak var searchContainerView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
         //searchTextField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchContainerView.dropShadow()
        searchContainerView.layer.cornerRadius = 8
        
        let nib = UINib(nibName: "CountryCell", bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: "CountryCell")
        
        tableView?.contentInset = UIEdgeInsetsMake(0, 0, 20, 0)
        
        searchPhotos(text: "random")
    }
    
    func searchPhotos(text: String) {
        
        photos = []
        
        let constants = Constants()
        let url: String = String(constants.searchPhotosURL(query: text, page: 1))
        
        print("URL: \(url)")
            
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                for object in json["results"].arrayValue {
                    
                    let photo = Photo(id: object["id"].stringValue, url: object["urls"]["regular"].stringValue, description: object["description"].stringValue)
                    self.photos.append(photo)
                    
                    self.tableView?.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
        let photo: Photo = photos[indexPath.row]
        cell.photoView.sd_setImage(with: URL(string: photo.url), completed: nil)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as NSString? {
            let txtAfterUpdate = text.replacingCharacters(in: range, with: string)
            searchPhotos(text: txtAfterUpdate)
        }
        return true
    }

    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        tableView?.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}
