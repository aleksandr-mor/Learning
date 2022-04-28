//
//  ViewController.swift
//  TestUIProgamatically
//
//  Created by Aleksandr Morozov on 28.04.2022.
//

import UIKit

class ViewController: UIViewController {

    var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .red
        
        label = UILabel()
        label.text = "Kick ass"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate(
           [ label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
           ]
            
            
            )
        
    }


}

