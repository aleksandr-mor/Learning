//
//  ShopView.swift
//  MVC
//
//  Created by Aleksandr Morozov on 30.06.2022.
//

import UIKit

class ShopView: UIView {

    @IBOutlet weak var tableView: UITableView!
    
    func configure() {
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = 100
    }

}
