//
//  ViewController.swift
//  SnapshotTesting
//
//  Created by Aleksandr Morozov on 11.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLbl: UILabel!
    
    var isDarkMode = false {
        didSet {
            view.backgroundColor = isDarkMode ? .black : .white
            helloLbl.textColor = isDarkMode ? .white : .black
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

