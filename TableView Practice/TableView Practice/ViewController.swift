//
//  ViewController.swift
//  TableView Practice
//
//  Created by Aleksandr Morozov on 05.01.2022.
//

import UIKit

    class ViewController: UIViewController, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.tableViewData.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
            cell.textLabel?.text = self.tableViewData[indexPath.row]
            return cell
        }
        
        let tableViewData = Array(repeating: "Item", count: 5)
        
    // MARK: - Outlets
        @IBOutlet weak var tableView: UITableView!
        
    // MARK: - Life Cycle
        override func viewDidLoad() {
            super.viewDidLoad()

            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TableViewCell")
            
            tableView.dataSource = self
        }


    }
    
