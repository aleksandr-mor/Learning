//
//  SecondViewController.swift
//  SendingDataDelegate
//
//  Created by Aleksandr Morozov on 02.02.2022.
//

import UIKit

protocol MyDataSendingDelegate {
    
    func sendDataToFirstViewController(myData: String)
}

class SecondViewController: UIViewController {

    var delegate: MyDataSendingDelegate? = nil
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
