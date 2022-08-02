//
//  ViewController.swift
//  Localization
//
//  Created by Aleksandr Morozov on 02.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello".localized()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myLabel)
        myLabel.frame = view.bounds
    }
}

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
