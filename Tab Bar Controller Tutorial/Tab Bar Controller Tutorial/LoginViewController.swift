//
//  ViewController.swift
//  Tab Bar Controller Tutorial
//
//  Created by Aleksandr Morozov on 31.03.2022.
//

import UIKit

class LoginViewController: UIViewController {

    enum Tabs: Int {
        case Dashboard
        case Middle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginTapped(_ sender: Any) {
        
        let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabController") as! MainTabController
        
        mainTabController.selectedViewController = mainTabController.viewControllers?[1]
        
        present(mainTabController, animated: true, completion: nil)
    }
    
}

