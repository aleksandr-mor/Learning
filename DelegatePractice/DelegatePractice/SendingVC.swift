//
//  SendingVC.swift
//  DelegatePractice
//
//  Created by Aleksandr Morozov on 07.02.2022.
//

import UIKit

protocol DataSentDelegate {
    func userDidEnterData(data: String)
}

class SendingVC: UIViewController {
    
    @IBOutlet weak var dataEntryTextField: UITextField!
    
    var delegate: DataSentDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func sendButtonWasPressed(_ sender: Any) {
        if delegate != nil {
            if dataEntryTextField.text != nil {
                let data = dataEntryTextField.text
                delegate?.userDidEnterData(data: data!)
                dismiss(animated: true, completion: nil)
            }
            
        }
    }
    
}
