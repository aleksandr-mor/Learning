//
//  SecondViewController.swift
//  DelegateFromScratches
//
//  Created by Aleksandr Morozov on 10.02.2022.
//

import UIKit

protocol MyDataSendingDelegateProtocol {
    func sendDataToFirstViewController(myData: String)
}

class SecondViewController: UIViewController {

    var delegate: MyDataSendingDelegateProtocol? = nil
    
    @IBOutlet weak var dataToSendTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func sendDataButtonClicked(_ sender: Any) {
        
        if self.delegate != nil && self.dataToSendTextField.text != nil {
            let dataToBeSent = self.dataToSendTextField.text
            self.delegate?.sendDataToFirstViewController(myData: dataToBeSent!)
            dismiss(animated: true, completion: nil)
        }
    }
}
