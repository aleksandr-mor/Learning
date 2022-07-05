 //
//  ViewController.swift
//  JustAnotherMVC
//
//  Created by Aleksandr Morozov on 05.07.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

struct Person {
    let firstName: String
    let lastName: String
    let gender: String
    let age: String
    let weight: Double
    let height: Double
    let location: Location
}

struct Location {
    let city: String
}
