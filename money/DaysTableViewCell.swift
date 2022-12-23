//
//  DaysTableViewCell.swift
//  Home-MC3
//
//  Created by Ghada on 01/03/2022.
//

import UIKit

class DaysTableViewCell: UITableViewCell {

    @IBOutlet weak var day: UILabel!

    @IBOutlet weak var info: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupCell(dayS: String, infoS: String){
        day.text = dayS
        info.text = infoS
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    

}
