//
//  WalletListTableViewCell.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/03/21.
//

import UIKit

class WalletListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleTextLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
