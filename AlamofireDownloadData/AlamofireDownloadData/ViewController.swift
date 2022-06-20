//
//  ViewController.swift
//  AlamofireDownloadData
//
//  Created by Aleksandr Morozov on 15.06.2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var completedLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let imageURL = "https://wallpaperaccess.com/full/327006.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.startAnimating()
        getImage(url: imageURL)
    }

    func getImage(url: String) {
        AF.download(url)
            .validate()
            .downloadProgress { progress in
                self.completedLabel.text = progress.localizedDescription
                self.progressView.setProgress(Float(progress.fractionCompleted), animated: true)
            }
            .responseData { (response) in
            if let data = response.value {
                let imageData = UIImage(data: data)
                self.imageView.image = imageData
                
                
            } else {
                self.completedLabel.text = "Error"
            }
                self.indicator.stopAnimating()
                self.indicator.isHidden = true
                self.progressView.isHidden = true
        }
    }
}

