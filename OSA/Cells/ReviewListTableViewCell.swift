//
//  ReviewListTableViewCell.swift
//  OSA
//
//  Created by Happy Sanz Tech on 03/03/21.
//

import UIKit

class ReviewListTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewerImage: UIImageView!
    @IBOutlet weak var reviewerName: UILabel!
    @IBOutlet weak var reviewText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
