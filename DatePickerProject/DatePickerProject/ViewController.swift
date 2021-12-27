//
//  ViewController.swift
//  DatePickerProject
//
//  Created by Aleksandr Morozov on 27.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // datePicker.maximumDate = Date()
    }


    @IBAction func datePickerAction(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy" //"MMM dd,yyyy"
        
        let selectedDateString = dateFormatter.string(from: selectedDate)
        textField.text = selectedDateString
       
        
        print(selectedDateString)
        
    }
}

