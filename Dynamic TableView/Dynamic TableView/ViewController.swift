//
//  ViewController.swift
//  Dynamic TableView
//
//  Created by Aleksandr Morozov on 08.01.2022.
//

import UIKit


class ViewController: UIViewController  {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var dataArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        print(dataArray.count)
        
    }

    @IBAction func addButtonAction(_ sender: UIBarButtonItem) {
        
        guard let enteredText = textField.text else {return}
        
        if  enteredText.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 {
            // textField is empty
            self.showAlert(title: "Alert", message: "Please enter some text!!")
            
        } else if dataArray.contains(enteredText) {
            self.showAlert(title: "Alert", message: "Duplicated")
            textField.text = ""
        }
       
        else {
            
            dataArray.append(enteredText)
            print(dataArray.count)
            tableView.reloadData()
            textField.text = nil
            view.endEditing(true)
        }
        
      
       
    }
   
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
         return cell
    }
}

extension ViewController : UITableViewDelegate {
    
}

extension UIViewController  {
    func showAlert( title : String , message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
