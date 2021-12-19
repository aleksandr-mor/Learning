//
//  ViewController.swift
//  LogIn ScrollView
//
//  Created by Aleksandr Morozov on 19.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func signInButtonPressed(_ sender: Any) {
        guard let url = URL(string: "https://google.com") else { return }
        UIApplication.shared.open(url)
    }
    

}

