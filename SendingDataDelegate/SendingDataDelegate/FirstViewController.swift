//
//  ViewController.swift
//  SendingDataDelegate
//
//  Created by Aleksandr Morozov on 06.02.2022.
//

import UIKit

class FirstViewController: UIViewController, MyDataSendingDelegateProtocol {

    @IBOutlet weak var receivedDataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func sendDataFirstViewController(myData: String) {
        self.receivedDataLabel.text = myData
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getDataSegue" {
            let secondVC: SecondViewController = segue.destination as! SecondViewController
            secondVC.delegate = self
        }
    }
}

