//
//  ViewController.swift
//  MVC-Arc
//
//  Created by Aleksandr Morozov on 02.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tickerLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBAction func buttonPressed(_ sender: Any) {
        displayData(i: randomCount.getRandomCount(data: testData))
    }
    
    private var count = 0
    private var testData: [Crypto] = []
    private var randomCount = RandomCount()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let model = Crypto.testData
        setupData(with: model)
        setupInitialState()
    }
    
    func setupInitialState() {
        displayData(i: count)
    }
    
    func setupData(with testData: ([Crypto])) {
        self.testData = testData
    }
    
    func displayData(i: Int) {
        if testData.count >= 0 && count <= (testData.count - 1) && count >= 0 {
            nameLabel.text = testData[i].name
            tickerLabel.text = testData[i].ticker
            valueLabel.text = String(testData[i].value)
        } else {
            print("Sorry, no data")
        }
    }
}

