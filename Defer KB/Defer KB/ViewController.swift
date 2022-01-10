//
//  ViewController.swift
//  Defer KB
//
//  Created by Aleksandr Morozov on 10.01.2022.
//

import UIKit

class ViewController: UIViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        waterTap()
    }


    func waterTap()  {
        
        defer {
            print("Close water tap 1")
            print("Close water tap 2")
            print("Close water tap 3")

        }
        
        print("Open water tap 1")
        
        print("Open water tap 2")
        
        print("Open water tap 3")
        
    }
    
}

