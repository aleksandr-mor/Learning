//
//  ViewController.swift
//  TableViewFamily
//
//  Created by Aleksandr Morozov on 06.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    var arrayDict = [[String: String]]()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayDict = [
            ["name": "Aleksandr"],
            ["name": "Olga"],
            ["name": "Sofia"],
            ["name": "Mikhail"],
            ["name": "Vishal"]
        ]
        
        tableView.dataSource = self
    }
}
    // MARK: - Extension
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = arrayDict[indexPath.row]["name"]
        return cell
    }
}
