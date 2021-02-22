//
//  OTPRouter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 12/02/21.
//

import Foundation
import UIKit

@objc protocol  OTPRoutingLogic
{
  func navigateToOtp(segue: UIStoryboardSegue?)
}

protocol  OTPDataPassing
{
  var dataStore:  OTPDataStore? { get }
}

class OTPRouter: NSObject,  OTPRoutingLogic,  OTPDataPassing
{
    func navigateToOtp(segue: UIStoryboardSegue?) {
        if let segue = segue {
          let destinationVC = segue.destination as! DashBoard
            navigateToOtp(source: viewController!, destination: destinationVC)
        } else {
            _ = viewController?.storyboard?.instantiateViewController(withIdentifier: "to_otp") as! OTPViewController
        }
    }
    
    func fetchItems(request:  OTPModel.Fetch.Request) {
        
    }
    
  weak var viewController:  OTPViewController?
  var dataStore: OTPDataStore?
  
  // MARK: Routing
  
    func navigateToOtp(source:  OTPViewController, destination: DashBoard)
    {
        source.navigationController?.pushViewController(source, animated: true)
    }
}
