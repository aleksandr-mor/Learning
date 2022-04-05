//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Aleksandr Morozov on 05.04.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }


}

