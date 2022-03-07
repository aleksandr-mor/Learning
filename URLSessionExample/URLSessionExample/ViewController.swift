//
//  ViewController.swift
//  URLSessionExample
//
//  Created by Aleksandr Morozov on 07.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func imageButtonPressed(_ sender: Any) {
        // 1 - Get API
        let API = "https://picsum.photos/300/300"
        // 2 - Create URL
        guard let apiURL = URL(string: API) else {
            fatalError("Some error")
        }
        // 3 - Session initialising
        let session = URLSession(configuration: .default)
        // 4 - Create dataTask
        let task = session.dataTask(with: apiURL) { (data, response, error) in
        // 5 - Process the received data
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                // data = .jpg
                self.imageView.image = UIImage(data: data)
            }
        }
        // launch the task
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

