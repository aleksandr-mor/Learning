//
//  PersonDetailVC.swift
//  TableView
//
//  Created by Aleksandr Morozov on 12.12.2021.
//

import UIKit

class PersonDetailVC: UIViewController {

    @IBOutlet weak var moviePict: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    
    var dic : [String : String]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let d = dic {
        
            moviePict.image = UIImage.init(named: "Image")
            movieLabel = 
            
        }
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
