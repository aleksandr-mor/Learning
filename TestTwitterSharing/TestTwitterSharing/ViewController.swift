//
//  ViewController.swift
//  TestTwitterSharing
//
//  Created by Aleksandr Morozov on 22.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func twitterButtonPressed(_ sender: Any) {
        let activityController = UIActivityViewController(activityItems: ["I got 1/20 in Qwifty! Check it up!\nhttps://apps.apple.com/ru/app/qwifty/id1626605129"], applicationActivities: nil)
            present(activityController, animated: true, completion: nil)
        }
    }

// https://apps.apple.com/us/app/swifty-quiz-app/id1624964426
