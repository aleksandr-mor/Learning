//
//  ViewController.swift
//  GetAndPost
//
//  Created by Aleksandr Morozov on 06.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func getTapped(_ sender: UIButton) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            guard let data = data else { return }
        }
    }
    
    @IBAction func PostTapped(_ sender: UIButton) {
    }
    
}

