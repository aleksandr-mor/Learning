//
//  ViewController.swift
//  SegmentController
//
//  Created by Aleksandr Morozov on 02.12.2021.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var mySegment: UISegmentedControl!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var mySliderLabel: UILabel!
    @IBOutlet weak var mySlider: UISlider!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        myStepper.maximumValue = 10
        mySlider.maximumValue = 100
        
    }
    
    @IBAction func stepperTapped(_ sender: UIStepper) {
        
        myLabel.text = "\(Int(myStepper.value))"
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        mySliderLabel.text = "\(Int(mySlider.value))"
    }
    
    @IBAction func mySegmentActions(_ sender: UISegmentedControl) {
        
        if  sender.selectedSegmentIndex == 0 {
            view.backgroundColor = .red
        } else if sender.selectedSegmentIndex == 1 {
            view.backgroundColor = .blue
        } else if sender.selectedSegmentIndex == 2 {
            view.backgroundColor = .green
        } else {
            view.backgroundColor = .brown
        }
    }
}

