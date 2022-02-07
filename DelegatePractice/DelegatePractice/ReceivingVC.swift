//
//  ViewController.swift
//  DelegatePractice
//
//  Created by Aleksandr Morozov on 07.02.2022.
//

import UIKit

class ReceivingVC: UIViewController, DataSentDelegate {
   
    
    @IBOutlet weak var receivingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func userDidEnterData(data: String) {
        receivingLabel.text = data
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showSendingVC" {
            let sendingVC: SendingVC = segue.destination as! SendingVC
            sendingVC.delegate = self
        }
    }
}

