//
//  ReviewOrderTableViewCell.swift
//  OSA
//
//  Created by Happy Sanz Tech on 16/03/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import UIKit

class ReviewOrderTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var delivery: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var MrpPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
