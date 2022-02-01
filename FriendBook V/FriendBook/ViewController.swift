//
//  ViewController.swift
//  FriendBook
//
//  Created by Vishal_Malvi on 27/01/22.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Properties
    var friendDataArray = [[String : String]]()
    
    //MARK:- lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    //MARK:- IBAction
    @IBAction func addButtonAction(_ sender: UIBarButtonItem) {
        if  let addFriendDetailsVC = self.storyboard?.instantiateViewController(identifier: "AddFriendDetailsVC") as? AddFriendDetailsVC {
            addFriendDetailsVC.delegate = self
            self.navigationController?.pushViewController(addFriendDetailsVC, animated: true)
        }
    }
}

//MARK:- UITableViewDataSource
extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let details = friendDataArray[indexPath.row] // from here we will get single dic from array of dic
        cell.textLabel?.text = details["firstName"]
        cell.detailTextLabel?.text = details["lastName"]
        return cell
    }
}
//MARK:- UITableViewDelegate
extension ViewController : UITableViewDelegate {
    // we will implement it later
}

//MARK:- AddFriendDetailsDelegate
extension ViewController : AddFriendDetailsDelegate {
    
    // from here we are adding data of friend
    func didAddedFriendDetails(with details: [String : String]) {
        friendDataArray.append(details)
        tableView.reloadData()
    }
}
