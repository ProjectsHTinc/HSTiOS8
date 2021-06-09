//
//  CartListTableViewCell.swift
//  OSA
//
//  Created by Happy Sanz Tech on 04/03/21.
//

import UIKit
import GMStepper

class CartListTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var actualPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var stockLabel: UILabel!
    @IBOutlet weak var MrpPrice: UILabel!
    @IBOutlet weak var deleteCart: UIButton!
//    @IBOutlet weak var stepper: GMStepper!
    @IBOutlet weak var stepper: GMStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
