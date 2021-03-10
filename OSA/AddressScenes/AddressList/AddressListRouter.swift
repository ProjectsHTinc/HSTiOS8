//
//  AddressListRouter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 09/03/21.
//


import Foundation
import UIKit

@objc protocol AddressListRoutingLogic
{
  func navigateTocategorySelect(segue: UIStoryboardSegue?)
}

protocol AddressListDataPassing
{
  var dataStore: AddressListDataStore? { get }
}

class AddressListRouter: NSObject, AddressListRoutingLogic, AddressListDataPassing
{
    func navigateTocategorySelect(segue: UIStoryboardSegue?) {
        if let segue = segue {
          let destinationVC = segue.destination as! CategorySelectViewController
            navigateTocategorySelect(source: viewController!, destination: destinationVC)
            
        } else {
            _ = viewController?.storyboard?.instantiateViewController(withIdentifier: "to-Category") as! CartListViewController
        }
    }
    func fetchItems(request: AddressListModel.Fetch.Request) {
        
    }
    
  weak var viewController: AddressListViewController?
  var dataStore: AddressListDataStore?
  
  // MARK: Routing
  
    func navigateTocategorySelect(source: AddressListViewController, destination: CategorySelectViewController)
    {
        source.navigationController?.pushViewController(source, animated: true)
    }
}
