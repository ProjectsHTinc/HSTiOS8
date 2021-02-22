//
//  EmailPasswordRouter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/02/21.
//

import Foundation
import UIKit

@objc protocol  ForgotPasswordRoutingLogic
{
  func navigateToOtp(segue: UIStoryboardSegue?)
}

protocol  ForgotPasswordDataPassing
{
  var dataStore:  ForgotPasswordDataStore? { get }
}

class ForgotPasswordRouter: NSObject,  ForgotPasswordRoutingLogic,  ForgotPasswordDataPassing
{
    func navigateToOtp(segue: UIStoryboardSegue?) {
        if let segue = segue {
          let destinationVC = segue.destination as! DashBoard
            navigateToOtp(source: viewController!, destination: destinationVC)
        } else {
            _ = viewController?.storyboard?.instantiateViewController(withIdentifier: "to_otp") as! ForgotPasswordViewController
        }
    }
    
    func fetchItems(request:  ForgotPasswordModel.Fetch.Request) {
        
    }
    
  weak var viewController:  ForgotPasswordViewController?
  var dataStore: ForgotPasswordDataStore?
  
  // MARK: Routing
  
    func navigateToOtp(source:  ForgotPasswordViewController, destination: DashBoard)
    {
        source.navigationController?.pushViewController(source, animated: true)
    }
}
