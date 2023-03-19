//
//  ViewController.swift
//  ThreadingProject
//
//  Created by Ali serkan Boyracı  on 19.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = Data()
    var tracker = 0
    
    let urlStrings = ["https://images.pexels.com/photos/3774243/pexels-photo-3774243.jpeg?cs=srgb&dl=pexels-james-wheeler-3774243.jpg&fm=jpg", "https://thumbs.dreamstime.com/z/sunrise-eftang-larvik-norway-over-rocky-beach-against-blue-cloudy-skies-135578681.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DispatchQueue.global().async {
            self.data = try! Data(contentsOf: URL(string: self.urlStrings[self.tracker])!) // backgorund thead
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: self.data) // must be main thread
            }
        }
        
        
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(changeImage))
        
        
    }
    
    @objc func changeImage() {
        
        if tracker == 0 {
            tracker += 1
        } else {
                tracker -= 1
        }
        
        DispatchQueue.global().async {
            self.data = try! Data(contentsOf: URL(string: self.urlStrings[self.tracker])!) // backgorund thead
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: self.data) // must be main thread
            }
        }
    
    
    }


}

extension ViewController : UITableViewDelegate {
    
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = UITableViewCell()
        cell.textLabel?.text = "Threading Test"
        return cell
    }
    
    
    
}
    

