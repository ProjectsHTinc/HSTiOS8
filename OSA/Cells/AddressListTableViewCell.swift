//
//  AddressListTableViewCell.swift
//  OSA
//
//  Created by Happy Sanz Tech on 09/03/21.
//

import UIKit

class AddressListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var areaLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var deleteAddress: UIButton!
    @IBOutlet weak var editAddress: UIButton!
    @IBOutlet weak var radioButton: UIButton!
    @IBOutlet weak var radioButImage: UIImageView!
    @IBOutlet weak var tickRadioButtonImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
