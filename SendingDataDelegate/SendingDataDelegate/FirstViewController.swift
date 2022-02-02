//
//  ViewController.swift
//  SendingDataDelegate
//
//  Created by Aleksandr Morozov on 02.02.2022.
//

import UIKit

class FirstViewController: UIViewController, MyDataSendingDelegate {
    
    

    @IBOutlet weak var receivedDataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func sendDataToFirstViewController(myData: String) {
        self.receivedDataLabel.text = myData
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getDataSegue" {
            let secondVC: SecondViewController = segue.destination as! SecondViewController
            secondVC.delegate = self
        }
    }
}

