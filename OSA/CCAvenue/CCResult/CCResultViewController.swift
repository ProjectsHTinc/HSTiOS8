//
//  CCResultViewController.swift
//  CCIntegrationKit_Swift
//
//  Created by Ram Mhapasekar on 7/7/17.
//  Copyright © 2017 Ram Mhapasekar. All rights reserved.
//
//
import UIKit
import SwiftyJSON

class CCResultViewController: UIViewController {

    var transStatus = String()
    var advancePayment = String()


    override func viewDidLoad() {
        super.viewDidLoad()

        let paybyCash = UserDefaults.standard.string(forKey: "PaybyCash")
        if (paybyCash == "YES")
        {
           
//            self.servicePaymentSuccess(order_id: GlobalVariables.shared.order_id)
        }
        else
        {
            if transStatus == "Transaction Successful"
            {
               
//               self.servicePaymentSuccess(order_id: GlobalVariables.shared.order_id)

            }
           else
           {

           }
        }
    }

//    override func viewWillLayoutSubviews() {
//        doneButton.addShadowToButton(color: UIColor.gray, cornerRadius: 20, backgroundcolor: UIColor(red: 19.0/255, green: 90.0/255, blue: 160.0/255, alpha: 1.0))
//    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print(transStatus)
    }

    @IBAction func doneAction(_ sender: Any)
    {
        let paybyCash = UserDefaults.standard.string(forKey: "PaybyCash")
        if transStatus == "Transaction Successful"
        {
            self.performSegue(withIdentifier: "to_wallet", sender: self)
        }
        else if (paybyCash == "YES")
        {
            self.performSegue(withIdentifier: "rateService", sender: self)
        }
        else
        {
            self.performSegue(withIdentifier: "home", sender: self)
        }
    }

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "to_wallet") {
            let _ = segue.destination as! WalletDetailsViewController
        }
        
    }
}

