//
//  NotificationListTableViewCell.swift
//  OSA
//
//  Created by Happy Sanz Tech on 07/04/21.
//  Copyright © 2021 Happy Sanz Tech. All rights reserved.
//

import UIKit

class NotificationListTableViewCell: UITableViewCell {

    @IBOutlet weak var Titlelabel: UILabel!
    @IBOutlet weak var offerLabel: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
