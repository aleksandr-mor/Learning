//
//  ViewController.swift
//  CustomTableViewCell
//
//  Created by Aleksandr Morozov on 22.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
      
        
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomViewCell", for: indexPath) as? CustomViewCell else { return UITableViewCell() }
        cell.lableMovieTitle.text = "Spider-Man: No Way Home"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            
            completionHandler(true)
        }
        let swipeAction = UISwipeActionsConfiguration(actions: [delete])
        swipeAction.performsFirstActionWithFullSwipe = false // This is the line which disables full swipe
        return swipeAction
    
    }
}
