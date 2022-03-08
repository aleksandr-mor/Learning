//
//  ViewController.swift
//  URLSessionTraining
//
//  Created by Aleksandr Morozov on 08.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func getButtonPressed(_ sender: Any) {
        // 1 get API
        let api = "https://picsum.photos/400/400"
        // 2 create URL
        guard let apiUrl = URL(string: api) else {
            fatalError("Some error")
        }
        // 3 Session initialising
        let session = URLSession(configuration: .default)
        // 4 Create dataTask
        let task = session.dataTask(with: apiUrl) { (data, response, error) in
            // 5 Process received data
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

