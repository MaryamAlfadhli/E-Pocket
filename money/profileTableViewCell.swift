//
//  profileTableViewCell.swift
//  money
//
//  Created by Maryam Aloudah on 07/03/2022.
//

import UIKit

class profileTableViewCell: UITableViewCell {
    @IBOutlet weak var iconsinProfile: UIImageView!
    
    
    @IBOutlet weak var titleinProfile: UILabel!
    func setUpcellProfile(titleProfile:String ,
                          iconsProfile: UIImage){
        
        titleinProfile.text = titleProfile
        iconsinProfile.image = iconsProfile
    }

    
   override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
