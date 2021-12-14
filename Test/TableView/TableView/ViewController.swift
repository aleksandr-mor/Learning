//
//  ViewController.swift
//  TableView
//
//  Created by Aleksandr Morozov on 12.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    let names = ["Aleksandr", "Olga", "Vishal", "Sofia", "Mikhail"]
    let Img = UIImage(named: "Image")
    let arrayDic = [
        ["name" : "Avengers: Endgame" , "Release date" : "2019" , "Image" : "Img"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }


}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = arrayDic[indexPath.row]["name"]
        cell.detailTextLabel?.text = arrayDic[indexPath.row]["Release date"]
        cell.imageView?.image = Img
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "PersonDetailVC") as? PersonDetailVC else { return }
        vc.dic = arrayDic[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

