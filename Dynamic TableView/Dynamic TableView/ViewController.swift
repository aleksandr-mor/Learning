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
        
        if  textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 {
            // textField is empty
            
            let alert = UIAlertController(title: "alert", message: "Enter some data", preferredStyle: UIAlertController.Style.alert)

                  // add an action (button)
                  alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                  // show the alert
                  self.present(alert, animated: true, completion: nil)
        }
        
      //  dataArray.contains(<#T##element: String##String#>)
        
        
        
        else {
            
            dataArray.append(textField.text ?? "")
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
