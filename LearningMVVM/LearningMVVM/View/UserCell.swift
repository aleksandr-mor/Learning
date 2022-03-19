//
//  UserCell.swift
//  LearningMVVM
//
//  Created by Aleksandr Morozov on 20.03.2022.
//

import UIKit
import Kingfisher

class UserCell: UITableViewCell {

    @IBOutlet private weak var userNameLbl: UILabel!
    @IBOutlet private weak var contactNumberLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet private weak var profileImageView: UIImageView!
    
    private var userVM: UserViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
                
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    fileprivate func addShadow() {
        self.layer.shadowOffset = CGSize(width: 1, height: 0)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.25

    }

    func configure(userVM: UserViewModel) {
        self.userVM = userVM
        addShadow()
        
        userNameLbl.text = userVM.fullName
        contactNumberLbl.text = userVM.contactNumber
        contactNumberLbl.textColor = UIColor.darkGray
        
        emailLbl.text = userVM.email
        emailLbl.textColor = UIColor.lightGray
        
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.clipsToBounds = true
        
        let placeholder = UIImage(named: "placeholder")
        if let url = userVM.thumbnailImageUrl {
            profileImageView.kf.indicatorType = .activity
            profileImageView.kf.setImage(with: url, placeholder: placeholder)
        }

        
    }
}
