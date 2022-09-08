//
//  ViewController.swift
//  UnitTesting
//
//  Created by Aleksandr Morozov on 08.09.2022.
//

import UIKit

class ViewController: UIViewController {

    let math = Arithmetic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Addition of 2 and 2 is: ", math.add(num1: 2, num2: 2))
        print("Multiplication of 2 and 5 is: ", math.mul(num1: 2, num2: 5))
    }


}

