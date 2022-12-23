//
//  WishliistTableViewCell.swift
//  money
//
//  Created by Maryam Aloudah on 07/03/2022.
//

import UIKit

class WishliistTableViewCell: UITableViewCell {

    @IBOutlet weak var chartwl: UIView!
    @IBOutlet weak var pricewl: UILabel!
    @IBOutlet weak var prodName: UILabel!
    override func
    awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupWlCell(price:Int , nameofproduct:String){
        
        pricewl.text =  "$\(price)"
        prodName.text = nameofproduct
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

