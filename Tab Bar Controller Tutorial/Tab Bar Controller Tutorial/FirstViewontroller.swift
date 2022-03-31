//
//  FirstViewontroller.swift
//  Tab Bar Controller Tutorial
//
//  Created by Aleksandr Morozov on 31.03.2022.
//

import Foundation
import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func logout(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
