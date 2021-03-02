//
//  Menu.swift
//  OSA
//
//  Created by Happy Sanz Tech on 11/02/21.
//

import UIKit
import SDWebImage

class Menu: UIViewController {

    private var navigationBarWasHidden = false
    
    @IBOutlet weak var userPic: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userMailidLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.userPic.sd_setImage(with: URL(string: GlobalVariables.shared.profile_picture), placeholderImage: UIImage(named: ""))
        self.userNameLbl.text = GlobalVariables.shared.first_name
        self.userMailidLbl.text = GlobalVariables.shared.phone_number
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Save if it was hidden initially
        self.navigationBarWasHidden = self.navigationController?.isNavigationBarHidden ?? false
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
                                                                                                                                
