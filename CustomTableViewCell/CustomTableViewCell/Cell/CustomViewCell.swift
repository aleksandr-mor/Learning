//
//  CustomViewCell.swift
//  CustomTableViewCell
//
//  Created by Aleksandr Morozov on 22.12.2021.
//

import UIKit

class CustomViewCell: UITableViewCell {

    @IBOutlet weak var imageViewMoviePoster: UIImageView!
    @IBOutlet weak var lableMovieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
