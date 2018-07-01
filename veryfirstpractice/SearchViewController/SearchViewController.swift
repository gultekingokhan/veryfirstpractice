//
//  SearchViewController.swift
//  veryfirstpractice
//
//  Created by Gokhan Gultekin on 10.06.2018.

import Alamofire
import SwiftyJSON
import SDWebImage
import Hero

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    var photos = [Photo]()
    @IBOutlet weak var tableView: VFTableView?
    @IBOutlet weak var searchContainerView: SearchContainerView!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        searchContainerView.hero.id = "containerView"

        tableView?.registerNib(string: "CountryCell")
        
        Parser.searchPhotos(query: "random", success: { (photosResult) in

            self.photos = photosResult
            self.tableView?.reloadData()
        }) { (error) in
            //Show alert
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
        let photo: Photo = photos[indexPath.row]
        cell.photoView.sd_setImage(with: URL(string: photo.url), completed: nil)
        
        cell.hero.id = "hero"

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as NSString? {
            let txtAfterUpdate = text.replacingCharacters(in: range, with: string)
            
            //MUST: Don't forget to clean photos array before calling this function.
            Parser.searchPhotos(query: txtAfterUpdate, success: { (photosResult) in
                self.photos = photosResult
                self.tableView?.reloadData()
            }) { (error) in
                //Show alert
            }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        detailVC.photo = photos[indexPath.row]
        detailVC.you = self
        hero.replaceViewController(with: detailVC)
        
        
        /*
        detailVC.photo = photos[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
        */
    }
}
