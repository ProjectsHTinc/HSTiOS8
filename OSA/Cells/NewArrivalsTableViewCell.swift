//
//  NewArrivalsTableViewCell.swift
//  OSA
//
//  Created by Happy Sanz Tech on 23/02/21.
//

import UIKit

class NewArrivalsTableViewCell: UITableViewCell {

    @IBOutlet weak var productTitlelabel: UILabel!
    @IBOutlet weak var MrpPriceLabel: UILabel!
    @IBOutlet weak var actualPriceLabel: UILabel!
    @IBOutlet weak var newArrivalImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
