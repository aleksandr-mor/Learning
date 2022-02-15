//
//  SecondViewController.swift
//  DelegateTutorial
//
//  Created by Aleksandr Morozov on 15.02.2022.
//

import UIKit

//MARK:- 1st
protocol SecondViewControllerDelegate  {
    func backFromFirstButton()
    func backSecondFirstButton()
    func backFromThirdButton()
    func backWithData(data : String)
}




class SecondViewController: UIViewController {

    //MARK:- 2nd
    var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func firstButtonAction(_ sender: UIButton) {
        //MARK:- 3rd // calling the delegate methods
        delegate?.backFromFirstButton()
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func secondButtonAction(_ sender: UIButton) {
        delegate?.backSecondFirstButton()
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func thirdButtonAction(_ sender: UIButton) {
        delegate?.backFromThirdButton()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backWithdataButtonAction(_ sender: UIButton) {
        delegate?.backWithData(data: "Hi aleks")
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
