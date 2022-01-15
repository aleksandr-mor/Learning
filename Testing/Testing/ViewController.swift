//
//  ViewController.swift
//  Testing
//
//  Created by Aleksandr Morozov on 15.01.2022.
//

import UIKit

class ViewController: UIViewController {

    var vishal: String? = "Vishal" //1
    var person : Person?
    var bag : Bag?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        person = Person(name: "test")
        bag  = Bag(brandName: "iBag")
        
        person?.bag = bag
        bag?.owner = person
        
        let p2 = Person(name: "test2")
       
        
        // == vs ===
        var vishal = "Vishal"
        var vCopy = "Vishal"
        
        if vishal  == vCopy {
            print("True")
        }
        
        
        if p2 === person {
            print("both are pointing to same refrence")
        } else {
            print("both are not pointing to same refrence")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.person = nil
        }
   
    }
    
    deinit {
        vishal = nil //0
    }


}

class Person {
    var name : String
    var bag : Bag?
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("getting call \(self.name)")
    }
}
class Bag {
    var brandName: String
   weak var owner : Person?
    init(brandName: String) {
        self.brandName = brandName
    }
    deinit {
        print("getting call \(self.brandName)")
    }
}
