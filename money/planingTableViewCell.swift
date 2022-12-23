//
//  planingTableViewCell.swift
//  money
//
//  Created by Maryam Aloudah on 01/08/1443 AH.
//

import UIKit

class planingTableViewCell: UITableViewCell {

    @IBOutlet weak var planStatus: UILabel!
    @IBOutlet weak var planCost: UILabel!
    @IBOutlet weak var planName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
func setupofCell  (Cost: Int ,statusofplan:String , Nameofplan:String )
    {
        planCost.text = "$ \(Cost)"
        planName.text = Nameofplan
        planStatus.text = statusofplan
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
