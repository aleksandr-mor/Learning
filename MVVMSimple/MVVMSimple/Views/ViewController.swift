//
//  ViewController.swift
//  MVVMSimple
//
//  Created by Aleksandr Morozov on 20.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func loginButtonPressed(_ sender: Any) {
        viewModel.userButtonPressed(login: (loginField.text ?? ""), password: (passwordField.text ?? ""))
    }
    @IBOutlet weak var label: UILabel!
    
    var viewModel = ViewModel()
    
    func initialState() {
        label.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        initialState()
    }
    
    func bindViewModel() {
        viewModel.statusText.bind({ (statusText) in
            DispatchQueue.main.async {
                self.label.text = statusText
            }
        })
    }


}

