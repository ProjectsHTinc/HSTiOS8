//
//  SubCategoryRouter.swift
//  OSA
//
//  Created by Happy Sanz Tech on 26/02/21.
//

import Foundation
import UIKit

@objc protocol SubCategoryListRoutingLogic
{
  func navigateTocategorySelect(segue: UIStoryboardSegue?)
}

protocol SubCategoryListDataPassing
{
  var dataStore: SubCategoryListDataStore? { get }
}

class SubCategoryListRouter: NSObject, SubCategoryListRoutingLogic, SubCategoryListDataPassing
{
    func navigateTocategorySelect(segue: UIStoryboardSegue?) {
        if let segue = segue {
          let destinationVC = segue.destination as! CategorySelectViewController
            navigateTocategorySelect(source: viewController2!, destination: destinationVC)
            
        } else {
            _ = viewController2?.storyboard?.instantiateViewController(withIdentifier: "to-Category") as! CategorySelectViewController
        }
    }
    func fetchItems(request: CategorySelectModel.Fetch.Request) {
        
    }
    
  weak var viewController2: CategorySelectViewController?
  var dataStore: SubCategoryListDataStore?
  
  // MARK: Routing
  
    func navigateTocategorySelect(source: CategorySelectViewController, destination: CategorySelectViewController)
    {
        source.navigationController?.pushViewController(source, animated: true)
    }
}
