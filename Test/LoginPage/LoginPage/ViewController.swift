//
//  ViewController.swift
//  LoginPage
//
//  Created by Aleksandr Morozov on 01.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TextFieldFName: UITextField!         // First Name
    @IBOutlet weak var TextFieldLName: UITextField!         // Last Name
    @IBOutlet weak var TextFieldEmail: UITextField!         // Email
    @IBOutlet weak var TextFieldMobileNumber: UITextField!  // Mobile
    @IBOutlet weak var TextFieldPassword: UITextField!      // Password (secure)
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var ButtonLogIn: UIButton!               // Log In Button
    @IBOutlet weak var mySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Log In Button Pressed
    
    @IBAction func mySwitchPressed(_ sender: Any) {
        TextView.text = ""
    }
    @IBAction func ButtonLogInPressed(_ sender: UIButton) {
    
        TextFieldFName.resignFirstResponder()        // Dismiss the keyboard if Log In button pressed from all TextField
        view.endEditing(true)
        
        print(TextFieldFName.text!)                             // Print the TextField value
        print(TextFieldLName.text!)
        print(TextFieldEmail.text!)
        print(TextFieldMobileNumber.text!)
        print("OMG! Password?! -> \(TextFieldPassword.text!)")
    }
}

//MARK: - Extension Dismiss the keyboard

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
}
