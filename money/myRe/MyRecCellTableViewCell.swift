//
//  MyRecCellTableViewCell.swift
//  myRe
//
//  Created by sumayah on 03/08/1443 AH.
//

import UIKit

class MyRecCellTableViewCell: UITableViewCell {
    
    var DataMyRe : DataMyRe!

    @IBOutlet weak var lbtitle: UILabel!
    @IBOutlet weak var lbdate: UILabel!
    @IBOutlet weak var MyRecImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        MyRecImage.layer.cornerRadius = MyRecImage.frame.size.width/2
        MyRecImage.clipsToBounds = true
        
//        lbdate.text = DataMyRe.reDate

        // Configure the view for the selected state
    }

}
