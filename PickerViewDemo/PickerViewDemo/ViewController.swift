//
//  ViewController.swift
//  PickerViewDemo
//
//  Created by Aleksandr Morozov on 27.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerDataFirst = ["a", "b", "c"]
//    var pickerDataSecond = ["1", "2", "3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        textField.text = pickerDataFirst[0]
        
        // For manual select a row
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.pickerView.selectRow(1, inComponent: 0, animated: true)
            self.textField.text = self.pickerDataFirst[1]
        }
        
    }


}

extension ViewController : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataFirst.count
//        if component == 0 {
//            return pickerDataFirst.count
//        } else {
//            return pickerDataSecond.count
//        }
        
    }
    
   
        
        // The data to return fopr the row and component (column) that's being passed in
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return  pickerDataFirst[row]
//            if component == 0 {
//                return pickerDataFirst[row]
//            } else {
//                return pickerDataSecond[row]
//            }
        }
}

extension ViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        textField.text = pickerDataFirst[row] // for setting textfield text
        print("selected component is \(component) , selected row is \(row) ")
    }
}
