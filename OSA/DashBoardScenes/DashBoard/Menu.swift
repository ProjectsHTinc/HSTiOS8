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
    
    @IBAction func logOutAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: Globals.alertTitle, message: "Are you sure want to log out", preferredStyle: .alert)

        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            NSLog("OK Pressed")
          
            GlobalVariables.shared.customer_id = ""
            GlobalVariables.shared.profile_picture = ""
            GlobalVariables.shared.phone_number = ""
            GlobalVariables.shared.first_name = ""
            GlobalVariables.shared.last_name = ""
            GlobalVariables.shared.email_Id = ""
            
            UserDefaults.standard.clearUserData()
            
            self.reNew()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }

        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)

        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    func reNew(){
            //reload application data (renew root view )
        UIApplication.shared.keyWindow?.rootViewController = storyboard!.instantiateViewController(withIdentifier: "nav")
    }
}

