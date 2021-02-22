//
//  EmailLoginRouter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 05/02/21.
//

import Foundation
import UIKit

@objc protocol EmailLoginRoutingLogic
{
  func navigateToOtp(segue: UIStoryboardSegue?)
}

protocol EmailLoginDataPassing
{
  var dataStore: EmailLoginDataStore? { get }
}

class EmailLoginRouter: NSObject, EmailLoginRoutingLogic, EmailLoginDataPassing
{
    func navigateToOtp(segue: UIStoryboardSegue?) {
        if let segue = segue {
          let destinationVC = segue.destination as! OTPViewController
            navigateToOtp(source: viewController!, destination: destinationVC)
        } else {
            _ = viewController?.storyboard?.instantiateViewController(withIdentifier: "to_otp") as! OTPViewController
        }
    }
    
    func fetchItems(request: EmailLoginModel.Fetch.Request) {
        
    }
    
  weak var viewController: EmailLoginViewController?
  var dataStore:EmailLoginDataStore?
  
  // MARK: Routing
  
    func navigateToOtp(source: EmailLoginViewController, destination: OTPViewController)
    {
        source.navigationController?.pushViewController(source, animated: true)
    }
}
