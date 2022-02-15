//
//  SecondViewController.swift
//  DelegateWithColorChange
//
//  Created by Aleksandr Morozov on 15.02.2022.
//

import UIKit

protocol SecondViewControllerDelegate {
    func redButtonAction()
    func yellowButtonAction()
    func greenButtonAction()
    func blackButtonAction()
}

class SecondViewController: UIViewController {

    var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func redButtonPressed(_ sender: UIButton) {
        delegate?.redButtonAction()
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func yellowButtonPressed(_ sender: UIButton) {
        delegate?.yellowButtonAction()
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func greenButtonPressed(_ sender: UIButton) {
        delegate?.greenButtonAction()
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func blackButtonPressed(_ sender: UIButton) {
        delegate?.blackButtonAction()
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
