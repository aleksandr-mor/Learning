//
//  ViewController.swift
//  Friend List
//
//  Created by Aleksandr Morozov on 03.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    
    let font = UIFont(name: "Charter-Bold", size: 14)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.layer.masksToBounds = true
        image.layer.cornerRadius = image.bounds.width / 2
        image.layer.borderWidth = 2
        image.layer.borderColor = #colorLiteral(red: 0.3783450127, green: 0.4734536409, blue: 0.9340841174, alpha: 1)
        
        saveButton.layer.cornerRadius = 5
        saveButton.titleLabel?.font =  UIFont(name: "Charter-Bold", size: 16)
        
        addButton.layer.cornerRadius = 20
        addButton.layer.borderWidth = 1
        addButton.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        //        addButton.layer.masksToBounds = false
        //        addButton.layer.cornerRadius = image.bounds.width / 2
        
    }
    
    @IBAction func cameraButtonAction(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = true //If you want edit option set "true"
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        imagePickerController.modalPresentationStyle = .fullScreen
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
}

extension ViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let tempImage = info[.editedImage] as! UIImage
        image.image  = tempImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

