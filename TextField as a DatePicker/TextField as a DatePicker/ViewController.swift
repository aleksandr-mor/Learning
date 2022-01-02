//
//  ViewController.swift
//  TextField as a DatePicker
//
//  Created by Aleksandr Morozov on 02.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        datePickerView.preferredDatePickerStyle = .wheels
        textField.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
    }
    @objc func handleDatePicker(sender: UIDatePicker) {
              let dateFormatter = DateFormatter()
              dateFormatter.dateFormat = "dd MMM yyyy"
        textField.text = dateFormatter.string(from: sender.date)
          }


          override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
              self.view.endEditing(true)
          }

    
}

