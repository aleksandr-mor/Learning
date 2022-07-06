 //
//  ViewController.swift
//  JustAnotherMVC
//
//  Created by Aleksandr Morozov on 05.07.2022.
//

import UIKit

class ViewController: UIViewController {

    let person = Person(
        firstName: "Aleks",
        lastName: "Smith",
        gender: "Male",
        age: "35",
        weight: 90.0,
        height: 90.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let myView = ExampleView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
        myView.center = view.center
        myView.configure(with: "\(person.firstName) \(person.lastName)")
        view.addSubview(myView)
    }
}

struct Person {
    let firstName: String
    let lastName: String
    let gender: String
    let age: String
    let weight: Double
    let height: Double
}

