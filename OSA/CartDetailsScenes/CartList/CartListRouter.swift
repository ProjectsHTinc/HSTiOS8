//
//  CartListRouter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 04/03/21.
//

import Foundation
import UIKit

@objc protocol CartListRoutingLogic
{
  func navigateTocategorySelect(segue: UIStoryboardSegue?)
}

protocol CartListDataPassing
{
  var dataStore: CartListDataStore? { get }
}

class CartListRouter: NSObject, CartListRoutingLogic, CartListDataPassing
{
    func navigateTocategorySelect(segue: UIStoryboardSegue?) {
        if let segue = segue {
          let destinationVC = segue.destination as! CategorySelectViewController
            navigateTocategorySelect(source: viewController!, destination: destinationVC)
            
        } else {
            _ = viewController?.storyboard?.instantiateViewController(withIdentifier: "to-Category") as! CartListViewController
        }
    }
    func fetchItems(request: CartListModel.Fetch.Request) {
        
    }
    
  weak var viewController: CartListViewController?
  var dataStore: CartListDataStore?
  
  // MARK: Routing
  
    func navigateTocategorySelect(source: CartListViewController, destination: CategorySelectViewController)
    {
        source.navigationController?.pushViewController(source, animated: true)
    }
}
