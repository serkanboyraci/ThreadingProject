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
        
        data = try! Data(contentsOf: URL(string: urlStrings[tracker])!)
        
        imageView.image = UIImage(data: data)
        
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(changeImage))
        
        
    }
    
    @objc func changeImage() {
        
        if tracker == 0 {
            tracker += 1
        } else {
                tracker -= 1
        }
    
        
        data = try! Data(contentsOf: URL(string: urlStrings[1])!)
        imageView.image = UIImage(data: data)
        
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
    

