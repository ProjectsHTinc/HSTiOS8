//
//  DashBoardRouter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 17/02/21.
//

import Foundation
import UIKit

@objc protocol DashBoardRoutingLogic
{
  func navigateToOtp(segue: UIStoryboardSegue?)
}

protocol DashBoardDataPassing
{
  var dataStore: DashBoardDataStore? { get }
}

class DashBoardRouter: NSObject, DashBoardRoutingLogic, DashBoardDataPassing
{
    func navigateToOtp(segue: UIStoryboardSegue?) {
        if let segue = segue {
          let destinationVC = segue.destination as! OTPViewController
            navigateToOtp(source: viewController!, destination: destinationVC)
        } else {
            _ = viewController?.storyboard?.instantiateViewController(withIdentifier: "to_otp") as! OTPViewController
        }
    }
    func fetchItems(request: DashBoardModel.Fetch.Request) {
        
    }
    
  weak var viewController: DashBoard?
  var dataStore:DashBoardDataStore?
  
  // MARK: Routing
  
    func navigateToOtp(source: DashBoard, destination: OTPViewController)
    {
        source.navigationController?.pushViewController(source, animated: true)
    }
}
