//
//  ViewController.swift
//  AlamofireTest
//
//  Created by Aleksandr Morozov on 17.04.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parameters = ["category": "Movies", "genre": "Action"]
        
        AF.request("https://httpbin.org/get", parameters: parameters).response { response in
            debugPrint(response)
        }
    }


}

