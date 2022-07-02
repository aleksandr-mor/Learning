//
//  ViewController.swift
//  MVC
//
//  Created by Aleksandr Morozov on 30.06.2022.
//

import UIKit

class ShopController: UIViewController {

    private var shopModel = ProductGroup.vegetables()
    
    private var shopView: ShopView! {
        guard isViewLoaded else { return nil }
        return (view as! ShopView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

private extension ShopController {
    func configure() {
        shopView.tableView.delegate = self
        shopView.tableView.dataSource = self
    }
}

extension ShopController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell")
        cell?.textLabel?.text = shopModel.products[indexPath.row].name
        return cell!
    }
}
