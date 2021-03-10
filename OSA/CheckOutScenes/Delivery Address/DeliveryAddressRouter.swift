//
//  DeliveryAddressRouter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 08/03/21.
//

import Foundation
import UIKit

@objc protocol DeliveryAddressRoutingLogic
{
  func navigateTocategorySelect(segue: UIStoryboardSegue?)
}

protocol DeliveryAddressDataPassing
{
  var dataStore: DeliveryAddressDataStore? { get }
}

class DeliveryAddressRouter: NSObject, DeliveryAddressRoutingLogic, DeliveryAddressDataPassing
{
    func navigateTocategorySelect(segue: UIStoryboardSegue?) {
        if let segue = segue {
          let destinationVC = segue.destination as! CategorySelectViewController
            navigateTocategorySelect(source: viewController!, destination: destinationVC)
            
        } else {
            _ = viewController?.storyboard?.instantiateViewController(withIdentifier: "to-Category") as! CartListViewController
        }
    }
    func fetchItems(request: DeliveryAddressModel.Fetch.Request) {
        
    }
    
  weak var viewController: CheckOutViewController?
  var dataStore: DeliveryAddressDataStore?
  
  // MARK: Routing
  
    func navigateTocategorySelect(source: CheckOutViewController, destination: CategorySelectViewController)
    {
        source.navigationController?.pushViewController(source, animated: true)
    }
}
