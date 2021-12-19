//
//  MovieDetailsVC.swift
//  Movie List
//
//  Created by Aleksandr Morozov on 19.12.2021.
//

import UIKit

class MovieDetailsVC: UIViewController {
    
    @IBOutlet weak var imageViewPoster: UIImageView!
    
    @IBOutlet weak var labelMovieTitle: UILabel!
    
    @IBOutlet weak var labelMovieDescription: UILabel!
    
    var dic: [String: String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewPoster.image = UIImage(named: (dic?["image"]!)!)
        labelMovieTitle.text = dic?["name"]
        labelMovieDescription.text = dic?["description"]

        // Do any additional setup after loading the view.
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
