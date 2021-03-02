//
//  CategorySelectRouter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 25/02/21.
//

import Foundation
import UIKit

@objc protocol CategorySelectRoutingLogic
{
  func navigateTocategorySelect(segue: UIStoryboardSegue?)
}

protocol CategorySelectDataPassing
{
  var dataStore: CategorySelectDataStore? { get }
}

class CategorySelectRouter: NSObject, CategorySelectRoutingLogic, CategorySelectDataPassing
{
    func navigateTocategorySelect(segue: UIStoryboardSegue?) {
        if let segue = segue {
          let destinationVC = segue.destination as! CategorySelectViewController
            navigateTocategorySelect(source: viewController!, destination: destinationVC)
            
        } else {
            _ = viewController?.storyboard?.instantiateViewController(withIdentifier: "to-Category") as! CategorySelectViewController
        }
    }
    func fetchItems(request: CategorySelectModel.Fetch.Request) {
        
    }
    
  weak var viewController: CategorySelectViewController?
  var dataStore:CategorySelectDataStore?
  
  // MARK: Routing
  
    func navigateTocategorySelect(source: CategorySelectViewController, destination: CategorySelectViewController)
    {
        source.navigationController?.pushViewController(source, animated: true)
    }
}
