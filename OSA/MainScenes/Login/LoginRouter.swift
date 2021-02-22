//
//  LoginRouter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 05/02/21.
//

import Foundation
import UIKit

@objc protocol LoginRoutingLogic
{
  func navigateToOtp(segue: UIStoryboardSegue?)
}

protocol LoginDataPassing
{
  var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing
{
    func navigateToOtp(segue: UIStoryboardSegue?) {
        if let segue = segue {
          let destinationVC = segue.destination as! OTPViewController
            navigateToOtp(source: viewController!, destination: destinationVC)
        } else {
            _ = viewController?.storyboard?.instantiateViewController(withIdentifier: "to_otp") as! OTPViewController
        }
    }
    
    func fetchItems(request: LoginModel.Fetch.Request) {
        
    }
    
  weak var viewController: LoginViewController?
  var dataStore:LoginDataStore?
  
  // MARK: Routing
  
    func navigateToOtp(source: LoginViewController, destination: OTPViewController)
    {
        source.navigationController?.pushViewController(source, animated: true)
    }
}
