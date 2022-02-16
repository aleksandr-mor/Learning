//
//  AddFriendDetailsVC.swift
//  FriendBook
//
//  Created by Vishal_Malvi on 27/01/22.
//

import UIKit

protocol AddFriendDetailsDelegate {
    func didAddedFriendDetails(with details : FriendsModel)
//    func didTapOnBackButton()
}


class AddFriendDetailsVC: UIViewController {

    //MARK:- IBOutlet
    @IBOutlet weak var textFieldFirstName: UITextField!
    @IBOutlet weak var textFieldLastName: UITextField!
    @IBOutlet weak var buttonAdd: UIButton!
    
    //MARK:- Properties
    var delegate : AddFriendDetailsDelegate?
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonAdd.layer.cornerRadius = buttonAdd.frame.height / 2
        buttonAdd.layer.masksToBounds = true
        
        UserDefaults.standard.set("Vishal", forKey: "name")
        
    }
    
    //MARK:- IBAction
    @IBAction func addButtonAction(_ sender: UIButton) {
        
        if validate() {
            guard let firstName =  textFieldFirstName.text , let lastName = textFieldLastName.text  else {return}
           // let detailsDic = ["firstName" : firstName.capitalized , "lastName" : lastName.capitalized]
            delegate?.didAddedFriendDetails(with: FriendsModel(firstName: firstName, lastName: lastName))
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
}

//MARK:- Helping Methods
extension AddFriendDetailsVC {
    
    private func validate() -> Bool {
        
        view.endEditing(true) // for closing the keyboard
        
        guard let firstName = textFieldFirstName.text , firstName.count > 0 else {
            showAlert(with: "Please add first name")
            return false
        }
        
        guard let lastName = textFieldLastName.text , lastName.count > 0 else {
            showAlert(with: "Please add last name")
            return false
        }
        return true
    }
    
    private func showAlert(with message : String)  {
        let alert = UIAlertController.init(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
