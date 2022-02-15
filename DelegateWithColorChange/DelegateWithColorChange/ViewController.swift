//
//  ViewController.swift
//  DelegateWithColorChange
//
//  Created by Aleksandr Morozov on 15.02.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func jumpButtonAction(_ sender: UIButton) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension ViewController : SecondViewControllerDelegate {
    func redButtonAction() {
        view.backgroundColor = .red
    }
    
    func yellowButtonAction() {
        view.backgroundColor = .yellow
    }
    
    func greenButtonAction() {
        view.backgroundColor = .green
    }
    
    func blackButtonAction() {
        view.backgroundColor = .black
    }
    
    
}
