//
//  SecondViewController.swift
//  SendingDataDelegate
//
//  Created by Aleksandr Morozov on 06.02.2022.
//

import UIKit

protocol MyDataSendingDelegateProtocol {
    func sendDataFirstViewController(myData: String)
}

class SecondViewController: UIViewController {
    
    var delegate: MyDataSendingDelegateProtocol? = nil

    @IBOutlet weak var dataToSendTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendDataButtonClicked(_ sender: Any) {
        
        if self.delegate != nil && self.dataToSendTextField.text != nil {
            let dataToBeSent = self.dataToSendTextField.text
            self.delegate?.sendDataFirstViewController(myData: dataToBeSent!)
            dismiss(animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
