//
//  ViewController.swift
//  DelegateTutorial
//
//  Created by Aleksandr Morozov on 15.02.2022.
//

import UIKit

class ViewController: UIViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func jumpButtonAction(_ sender: UIButton) {
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            vc.delegate = self // MARK:- 4th
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

// MARK:- 5th
extension ViewController : SecondViewControllerDelegate {
    
    func backWithData(data: String) {
        print(data)
    }
    
    
    func backFromFirstButton() {
        print("Back from the first button")
    }
    
    func backSecondFirstButton() {
        print("Back from the 2nd button")
    }
    
    func backFromThirdButton() {
        print("Back from the 3d button")
    }
    
    
}

