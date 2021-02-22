//
//  SignUpRouter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/02/21.
//

import Foundation
import UIKit

@objc protocol SignupRoutingLogic
{
  func navigateToOtp(segue: UIStoryboardSegue?)
}

protocol SignupDataPassing
{
  var dataStore: SignupDataStore? { get }
}

class SignupRouter: NSObject, SignupRoutingLogic, SignupDataPassing
{
    func navigateToOtp(segue: UIStoryboardSegue?) {
        if let segue = segue {
          let destinationVC = segue.destination as! OTPViewController
            navigateToOtp(source: viewController!, destination: destinationVC)
        } else {
            _ = viewController?.storyboard?.instantiateViewController(withIdentifier: "to_otp") as! OTPViewController
        }
    }
    
    func fetchItems(request: SignupModel.Fetch.Request) {
        
    }
    
  weak var viewController: SignupViewController?
  var dataStore:SignupDataStore?
  
  // MARK: Routing
  
    func navigateToOtp(source: SignupViewController, destination: OTPViewController)
    {
        source.navigationController?.pushViewController(source, animated: true)
    }
}
