//
//  ViewController.swift
//  Gestures
//
//  Created by Aleksandr Morozov on 14.03.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        myView.backgroundColor = .red
        myView.center = view.center
        view.addSubview(myView)
        // Tap gesture recognizer
//        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gestureFire(_:)))
//        gestureRecognizer.numberOfTapsRequired = 2
//        gestureRecognizer.numberOfTouchesRequired = 1
        
        myView.addGestureRecognizer(gestureRecognizer)
        myView.isUserInteractionEnabled = true
    }
    
   @objc func gestureFire(_ gesture: UITapGestureRecognizer) {
        print("gesture fired")
    }

}

